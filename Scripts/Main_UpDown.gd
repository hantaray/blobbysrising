extends Node2D


var enemy_truck = preload("res://characters/enemies/enemy_truck.tscn")
var enemy_klein_auto = preload("res://characters/enemies/autoKlein_enemy.tscn")
var enemy_schlagloch = preload("res://characters/enemies/enemy_schlagloch.tscn")
var enemy_spur_blocker = preload("res://characters/enemies/enemy_spur_blocker.tscn")
var friend_fahrrad_schild = preload("res://characters/friends/friend_fahrradschild.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

var spawningPointsFriend = [Vector2(1300, 280), \
							Vector2(1300, 790)]
var spawningPointsEnemy = [Vector2(-1300, 280), \
							Vector2(-1300, 790)]

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	MainScript.current_scene = "Street"
	GamePlayData.playerSpeed  = 600
	GamePlayData.enemyCarSpeed  = 800
	GamePlayData.enemyTruckSpeed  = 800
	randomize()
	$EnemyTimer.start()
	


func _on_EnemyTimer_timeout():
	var spawningPos = spawningPointsFriend[randi() % 2]
	var mob = friend_fahrrad_schild.instance()
	var rndBlockerSpawn = randi() % 2
	var blocker = enemy_schlagloch.instance()
	if rndBlockerSpawn == 0:
		blocker = enemy_spur_blocker.instance()
	add_child(mob)
	blocker.position.x = mob.position.x
	mob.position = spawningPos
	if mob.position.y > 545:
		blocker.position.y = -240
	else:
		blocker.position.y = 260
	mob.add_child(blocker)
	mob.z_index = -1
	mob.position.x += $Player.position.x
	# Make shure friend is spawned at least all 5 spawns
	if noFriendSpawnCounter < 1:
		var rndFactorSpawn = randi() % 3
		if rndFactorSpawn == 0:
			mob = enemy_klein_auto.instance()
			noFriendSpawnCounter += 1
		elif rndFactorSpawn == 1:
			mob = enemy_truck.instance()
			noFriendSpawnCounter += 1
		if prevMob == "enemy_truck":
			mob = enemy_klein_auto.instance()
		spawningPos = spawningPointsEnemy[randi() % 2]
	else:
		mob.z_index = -1
		noFriendSpawnCounter = 0
	prevMob = mob.name
	add_child(mob)
	mob.position = spawningPos
	mob.position.x += $Player.position.x

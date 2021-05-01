extends Node2D


var enemy_truck = preload("res://characters/enemies/enemy_truck.tscn")
var enemy_klein_auto = preload("res://characters/enemies/autoKlein_enemy.tscn")
var enemy_schlagloch = preload("res://characters/enemies/enemy_schlagloch.tscn")
var enemy_spur_blocker = preload("res://characters/enemies/enemy_spur_blocker.tscn")
var friend_fahrrad_schild = preload("res://characters/friends/friend_fahrradschild.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

var spawningPointsFriend = [Vector2(1300, 250), \
							Vector2(1300, 820)]
var spawningPointsEnemy = [Vector2(-1300, 250), \
							Vector2(-1300, 820)]

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	MainScript.current_scene = "Street"
	GamePlayData.playerSpeed  = 600
	GamePlayData.enemyCarSpeed  = 800
	GamePlayData.enemyTruckSpeed  = 800
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	get_tree().paused = true

func _on_FriendSpawnTimer_timeout():
	spawn_friend()
	
func _on_EnemySpawnTimer_timeout():
	spawn_enemy()

func spawn_enemy():
	var mob
	var spawningPos = spawningPointsEnemy[randi() % 2]
	var rndFactorSpawn = randi() % 2
	if rndFactorSpawn == 0:
		mob = enemy_klein_auto.instance()
	elif rndFactorSpawn == 1:
		mob = enemy_truck.instance()
	if prevMob == "enemy_truck":
		mob = enemy_klein_auto.instance()
		
	prevMob = mob.name
	add_child(mob)
	mob.position = spawningPos
	mob.position.x = $Player.position.x - 1200
	
func spawn_friend():
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
		blocker.position.y = -280
	else:
		blocker.position.y = 280
	mob.add_child(blocker)
	mob.z_index = -1
	mob.position.x += $Player.position.x

#	add_child(mob)
#	add_child(mob)
#	mob.position.x = $Player.position.x + 1200

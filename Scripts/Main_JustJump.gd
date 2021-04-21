extends Node2D


var enemyTank = preload("res://characters/enemies/enemy_tank.tscn")
var friendDove = preload("res://characters/friends/friend_dove.tscn")
var enemyBouncyBlob = preload("res://characters/enemies/enemy_bouncyblob.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	MainScript.current_scene = "Forest"
	randomize()
	$EnemyTimer.start()

func _on_EnemyTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()	
	var mob = friendDove.instance()
	# Make shure friend is spawned at least all 5 spawns
	if noFriendSpawnCounter < 5:
		var rndFactorSpawn = randi() % 3
		if rndFactorSpawn == 0:
			mob = enemyTank.instance()
			noFriendSpawnCounter += 1
		elif rndFactorSpawn == 1:
			mob = enemyBouncyBlob.instance()
			noFriendSpawnCounter += 1
		if prevMob == "enemy_bouncyblob":
			mob = enemyTank.instance()
	else:
		noFriendSpawnCounter = 0
	prevMob = mob.name
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x

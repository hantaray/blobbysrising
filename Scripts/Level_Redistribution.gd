extends Node2D

var enemy_panama_bkf = preload("res://characters/enemies/enemy_panama_bkf.tscn")
var friend_koffer = preload("res://characters/friends/friend_koffer.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	get_node("Music").play()
	MainScript.current_scene = "Subway"
	GamePlayData.playerSpeed  = 600
	randomize()
	$EnemySpawnTimer.start()
	get_tree().paused = true

func _on_EnemySpawnTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()	
	var mob = friend_koffer.instance()
	# Make shure friend is spawned at least all 5 spawns
	if noFriendSpawnCounter < 5:
		var rndFactorSpawn = randi() % 2
		if rndFactorSpawn == 0:
			mob = enemy_panama_bkf.instance()
			noFriendSpawnCounter += 1
	else:
		noFriendSpawnCounter = 0
	prevMob = mob.name
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x

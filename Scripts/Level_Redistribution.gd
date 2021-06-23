extends Node2D

var enemy_panama_bkf = preload("res://characters/enemies/enemy_panama_bkf.tscn")
var friend_koffer = preload("res://characters/friends/friend_koffer.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0
var prevMoneySpawn = Vector2(0,0)

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	get_node("Music").play()
	MainScript.current_scene = "Redis"
	GamePlayData.playerSpeed  = 900
	randomize()
	$EnemySpawnTimer.start()
	if !MainScript.levelRestart:
		get_tree().paused = true

func _on_EnemySpawnTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()
	var mob = enemy_panama_bkf.instance()
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	# Make sure panama is spawned where the last money was spawned
	mob.position.x += $Player.position.x

func _on_FriendSpawnTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()
	var mob = friend_koffer.instance()
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	# Make sure panama is spawned where the last money was spawned
	mob.position.x += $Player.position.x
	
#	# Spawn enemy right after friend
#	prevMoneySpawn = mob.position
#	mob = enemy_panama_bkf.instance()
#	add_child(mob)
#	mob.position = prevMoneySpawn
#	mob.position.x += $Player.position.x

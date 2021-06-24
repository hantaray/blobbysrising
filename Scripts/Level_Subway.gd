extends Node2D



var enemy_interblobexpress = preload("res://characters/enemies/enemy_interBlobExpress.tscn")
var enemy_ticket = preload("res://characters/enemies/enemy_ticket.tscn")
var friend_station_sign = preload("res://characters/friends/friend_station_sign.tscn")
var friend_screw = preload("res://characters/friends/friend_screw.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	get_node("Music").play()
	MainScript.current_scene = "Subway"
	GamePlayData.playerSpeed  = 900
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	if !MainScript.levelRestart:
		get_tree().paused = true

func _on_EnemySpawnTimer_timeout():
	var mob
	var rndFactorSpawn = randi() % 2
	if rndFactorSpawn == 0:
		mob = enemy_ticket.instance()
	elif rndFactorSpawn == 1:
		mob = enemy_interblobexpress.instance()
	if prevMob == "enemy_interBlobExpress":
		mob = enemy_ticket.instance()
		
	prevMob = mob.name
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x


func _on_FriendSpawnTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()
	var mob = friend_station_sign.instance()
	# rnd spawning for second friend
	var rndFactorFriend = randi() % 2
	if rndFactorFriend == 0:
		mob = friend_screw.instance()
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x

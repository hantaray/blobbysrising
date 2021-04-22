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
	MainScript.current_scene = "Subway"
	randomize()
	$EnemyTimer.start()

func _on_EnemyTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()	
	var mob = friend_station_sign.instance()
	# rnd spawning for second friend
	var rndFactorFriend = randi() % 3
	if rndFactorFriend == 0:
		mob = friend_screw.instance()
	# Make shure friend is spawned at least all 5 spawns
	if noFriendSpawnCounter < 5:
		var rndFactorSpawn = randi() % 3
		if rndFactorSpawn == 0:
			mob = enemy_ticket.instance()
			noFriendSpawnCounter += 1
		elif rndFactorSpawn == 1:
			mob = enemy_interblobexpress.instance()
			noFriendSpawnCounter += 1
		if prevMob == "enemy_interBlobExpress":
			mob = enemy_ticket.instance()
	else:
		noFriendSpawnCounter = 0
	prevMob = mob.name
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x

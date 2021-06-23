extends Node2D



var klappe_enemy = preload("res://characters/enemies/klappe_enemy.tscn")
var deckel_friend = preload("res://characters/friends/deckel_friend.tscn")
var schloss_enemy = preload("res://characters/enemies/schloss_enemy.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

var spawningPoints = [Vector2(2300, 315), 
	Vector2(2300, 550), Vector2(2300, 765), Vector2(2300, 965)]

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	get_node("Music").play()
	MainScript.current_scene = "City"
	GamePlayData.playerSpeed  = 900
	randomize()
	$EnemySpawnTimer.start()
	if !MainScript.levelRestart:
		get_tree().paused = true
	


func _on_EnemySpawnTimer_timeout():
	var enemyPos = spawningPoints[randi() % 4]
	var mob = deckel_friend.instance()	
	# Make shure friend is spawned at least all 5 spawns
	if noFriendSpawnCounter < 5:
		var rndFactorSpawn = randi() % 3
		if rndFactorSpawn == 0:
			mob = klappe_enemy.instance()
			noFriendSpawnCounter += 1
		elif rndFactorSpawn == 1:
			mob = schloss_enemy.instance()
			noFriendSpawnCounter += 1
		if prevMob == "schloss_enemy":
			mob = klappe_enemy.instance()
	else:
		noFriendSpawnCounter = 0
	prevMob = mob.name
	add_child(mob)
	mob.position = enemyPos
	mob.position.x += $Player.position.x

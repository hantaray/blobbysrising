extends Node2D



var lohnbrief_friend = preload("res://characters/friends/lohnbrief_friend.tscn")
var patientenschluessel_friend = preload("res://characters/friends/patientenschluessel_friend.tscn")
var coroni_enemy = preload("res://characters/enemies/enemy_coroni.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

var spawningPoints = [Vector2(2300, 115), Vector2(2300, 315), 
	Vector2(2300, 550), Vector2(2300, 765), Vector2(2300, 965)]

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	get_node("Music").play()
	MainScript.current_scene = "Caring"
	GamePlayData.playerSpeed  = 900
	randomize()
	$EnemySpawnTimer.start()
	get_tree().paused = true
	


func _on_EnemySpawnTimer_timeout():
	var enemyPos = spawningPoints[randi() % 5]
	var mob = patientenschluessel_friend.instance()	
	# Make shure friend is spawned at least all 5 spawns
	if noFriendSpawnCounter < 5:
		var rndFactorSpawn = randi() % 3
		if rndFactorSpawn == 0:
			mob = lohnbrief_friend.instance()
			noFriendSpawnCounter += 1
		elif rndFactorSpawn == 1:
			mob = coroni_enemy.instance()
			noFriendSpawnCounter += 1
		if prevMob == "schloss_enemy":
			mob = lohnbrief_friend.instance()
	else:
		noFriendSpawnCounter = 0
	prevMob = mob.name
	add_child(mob)
	mob.position = enemyPos
	mob.position.x += $Player.position.x

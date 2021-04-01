extends Node2D



var klappe_enemy = preload("res://characters/enemies/klappe_enemy.tscn")
var deckel_friend = preload("res://characters/friends/deckel_friend.tscn")
var schloss_enemy = preload("res://characters/enemies/schloss_enemy.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

var spawningPoints = [Vector2(2300, 175), Vector2(2300, 375), 
	Vector2(2300, 575), Vector2(2300, 775), Vector2(2300, 975)]

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	randomize()
	$EnemyTimer.start()


func _on_EnemyTimer_timeout():
	var enemyPos = spawningPoints[randi() % 5]
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

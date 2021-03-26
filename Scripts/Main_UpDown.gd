extends Node2D

var score = 0

var enemyTruck = preload("res://characters/enemies/enemy_truck.tscn")
var enemyKleinAuto = preload("res://characters/enemies/autoKlein_enemy.tscn")
var friendFahrradSchild = preload("res://characters/friends/friend_fahrradschild.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

var spawningPointsFriend = [Vector2(1300, 275), Vector2(1300, 550), Vector2(1300, 825)]
var spawningPointsEnemy = [Vector2(-1300, 275), Vector2(-1300, 550), Vector2(-1300, 825)]

func _ready():
	randomize()
	$EnemyTimer.start()
	
func increase_score():
	score += 1
	$HUD.update_score(score)
	
#	if score == 10:
#		get_tree().change_scene("res://levels/LaneMovement.tscn")
	
	if score % 2 == 0:
		MainScript.playerSpeed  += 100
		MainScript.enemyCarSpeed  += 100
		MainScript.enemyTruckSpeed  += 100
	
	
# hab hier den paramter ergänzt zum einstellen im enemy scripten
func decrease_score(var points):
	#if score >= 1:
	score -= points
	$HUD.update_score(score)

func _on_EnemyTimer_timeout():
	var spawningPos = spawningPointsFriend[randi() % 3]
	var mob = friendFahrradSchild.instance()
	add_child(mob)
	mob.position = spawningPos
	mob.position.x += $Player.position.x
	
	# Make shure friend is spawned at least all 5 spawns
	if noFriendSpawnCounter < 1:
		var rndFactorSpawn = randi() % 3
		if rndFactorSpawn == 0:
			mob = enemyKleinAuto.instance()
			noFriendSpawnCounter += 1
		elif rndFactorSpawn == 1:
			mob = enemyTruck.instance()
			noFriendSpawnCounter += 1
		if prevMob == "enemy_truck":

			mob = enemyKleinAuto.instance()
		spawningPos = spawningPointsEnemy[randi() % 3]
	else:
		noFriendSpawnCounter = 0
		
	prevMob = mob.name
		
	add_child(mob)
	mob.position = spawningPos
	mob.position.x += $Player.position.x

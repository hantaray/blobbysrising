extends Node2D

var score = 0

var enemyTank = preload("res://characters/enemies/klappe_enemy.tscn")
var friendDove = preload("res://characters/friends/deckel_friend.tscn")
var enemyBouncyBlob = preload("res://characters/enemies/schloss_enemy.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

var spawningPoints = [Vector2(2300, 175), Vector2(2300, 375), 
	Vector2(2300, 575), Vector2(2300, 775), Vector2(2300, 975)]

func _enter_tree():
	MainScript.reset_lifes()

func _ready():
	MainScript.reset_lifes()
	randomize()
	$EnemyTimer.start()
	
func increase_score():
	score += 1
	$HUD.update_score(score)
	
#	if score == 10:
#		get_tree().change_scene("res://levels/JumpMovement.tscn")
	
	if score % 5 == 0:
		$Player.SPEED += 100
	
	
# hab hier den paramter ergänzt zum einstellen im enemy scripten
func decrease_score(var points):
	#if score >= 1:
	score -= points
	$HUD.update_score(score)

func _on_EnemyTimer_timeout():
	var enemyPos = spawningPoints[randi() % 5]
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
		if prevMob == "schloss_enemy":
			mob = enemyTank.instance()
	else:
		noFriendSpawnCounter = 0
		
	prevMob = mob.name
		
	add_child(mob)
	mob.position = enemyPos
	mob.position.x += $Player.position.x

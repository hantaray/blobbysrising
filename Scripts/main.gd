extends Node2D

var score = 0
var spawningPoints = [Vector2(2300, 100), Vector2(2300, 500), Vector2(2300, 900)]

var enemyXPosOffset = 0
var enemyTank = preload("res://Enemies/Enemy_Tank.tscn")
var friendDove = preload("res://Friends/Friend_Dove.tscn")

func _ready():
	$EnemyTimer.start()
	
func increase_score():
	score += 1
	$HUD.update_score(score)
	
func decrease_score():
	#if score >= 1:
	score -= 3
	$HUD.update_score(score)

func _on_EnemyTimer_timeout():
	enemyXPosOffset += 800
	var enemyPos = spawningPoints[randi() % 3]
	# Choose a random location on Path2D.
	$SpawnPath/SpawnLocation.offset = randi() % 4
	var mob = enemyTank.instance()  
	if randi() % 2 == 0:
		mob = friendDove.instance()
	else:
		mob = enemyTank.instance()
	
	add_child(mob)
	mob.position = enemyPos
#	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += enemyXPosOffset

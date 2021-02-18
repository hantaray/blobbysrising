extends Node2D

var score = 0

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
	# Choose a random location on Path2D.
	$SpawnPath/SpawnLocation.offset = randi()
	var mob = enemyTank.instance()  
	if randi() % 2 == 0:
		mob = friendDove.instance()
	else:
		mob = enemyTank.instance()
	
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += enemyXPosOffset

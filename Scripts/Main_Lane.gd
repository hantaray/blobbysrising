extends Node2D

var score = 0

var enemyTank = preload("res://Enemies/Enemy_Tank.tscn")
var friendDove = preload("res://Friends/Friend_Dove.tscn")
var enemyBouncyBlob = preload("res://Enemies/Enemy_BouncyBlob.tscn")

var spawningPoints = [Vector2(2300, 100), Vector2(2300, 300), Vector2(2300, 500), Vector2(2300, 700), Vector2(2300, 900)]

func _ready():
	randomize()
	$EnemyTimer.start()
	
func increase_score():
	score += 1
	$HUD.update_score(score)
	
	if score == 10:
		get_tree().change_scene("res://Scenes/JumpMovement.tscn")
	
	if score % 5 == 0:
		$Player.SPEED += 100
	
	
# hab hier den paramter ergänzt zum einstellen im enemy scripten
func decrease_score(var points):
	#if score >= 1:
	score -= points
	$HUD.update_score(score)

func _on_EnemyTimer_timeout():
	var enemyPos = spawningPoints[randi() % 5]
	var mob = enemyTank.instance()
	var rndFactorSpawn = randi() % 3
	if rndFactorSpawn == 0:
		mob = friendDove.instance()
	elif rndFactorSpawn == 1:
		mob = enemyBouncyBlob.instance()
	
	add_child(mob)
	mob.position = enemyPos
	mob.position.x += $Player.position.x

extends Node2D

var score = 0
var spawningPoints = [Vector2(2300, 100), Vector2(2300, 500), Vector2(2300, 900)]

var enemyXPosOffset = 0
var enemyTank = preload("res://Enemies/Enemy_Tank.tscn")
var friendDove = preload("res://Friends/Friend_Dove.tscn")
var enemyBouncyBlob = preload("res://Enemies/Enemy_BouncyBlob.tscn")

func _ready():
	$EnemyTimer.start()
	
func increase_score():
	score += 1
	$HUD.update_score(score)
	
	
# hab hier den paramter ergänzt zum einstellen im enemy scripten
func decrease_score(var points):
	#if score >= 1:
	score -= points
	$HUD.update_score(score)

func _on_EnemyTimer_timeout():
	enemyXPosOffset += 800
	var enemyPos = spawningPoints[randi() % 3]
	# Choose a random location on Path2D.
	$SpawnPath/SpawnLocation.offset = randi()
	var mob = enemyTank.instance()
	var rndFactorSpawn = randi() % 3
	if rndFactorSpawn == 0:
		mob = friendDove.instance()
	elif rndFactorSpawn == 1:
		mob = enemyBouncyBlob.instance()
	# hab das letzte else rausgenommen, da unnötig mob ist ja bereits tank
	
	
	add_child(mob)
	mob.position = enemyPos
	# hab die Zeile wieder angemacht, scheint jetzt wieder auf dem ganzen Pfad zu spawnen, richtig?
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += enemyXPosOffset

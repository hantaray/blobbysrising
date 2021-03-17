extends Node2D

var score = 0
signal changeLevel

var enemyTank = preload("res://characters/enemies/Enemy_Tank.tscn")
var friendDove = preload("res://characters/friends/Friend_Dove.tscn")
var enemyBouncyBlob = preload("res://characters/enemies/Enemy_BouncyBlob.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

func _ready():
	randomize()
	$EnemyTimer.start()
	
func increase_score():
	score += 1
	$HUD.update_score(score)
#
#	if score == 50:
#		get_tree().change_scene("res://levels/UpDownMovement.tscn")
	
	if score % 5 == 0:
		$Player.SPEED += 100
	
	
# hab hier den paramter ergänzt zum einstellen im enemy scripten
func decrease_score(var points):
	#if score >= 1:
	score -= points
	$HUD.update_score(score)

func _on_EnemyTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()
	
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
		if prevMob == "Enemy_BouncyBlob":
			mob = enemyTank.instance()
	else:
		noFriendSpawnCounter = 0
		
	prevMob = mob.name
		
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x

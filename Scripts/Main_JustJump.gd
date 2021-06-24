extends Node2D


var enemyTank = preload("res://characters/enemies/enemy_tank.tscn")
var friendDove = preload("res://characters/friends/Friend_Dove.tscn")
var enemyBouncyBlob = preload("res://characters/enemies/Enemy_Gun.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	get_node("Music").play()
	MainScript.current_scene = "Peace"
	GamePlayData.playerSpeed  = 900
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	if !MainScript.levelRestart:
		get_tree().paused = true

func _on_EnemySpawnTimer_timeout():
	var mob
	$SpawnPath/SpawnLocation.offset = randi()
	var rndFactorSpawn = randi() % 2
	if rndFactorSpawn == 0:
		mob = enemyTank.instance()
	elif rndFactorSpawn == 1:
		mob = enemyBouncyBlob.instance()
	if prevMob == "enemy_bouncyblob":
		mob = enemyTank.instance()
			
	prevMob = mob.name
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x


func _on_FriendSpawnTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()
	var mob = friendDove.instance()
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x

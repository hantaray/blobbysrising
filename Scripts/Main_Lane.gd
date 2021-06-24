extends Node2D



var klappe_enemy = preload("res://characters/enemies/klappe_enemy.tscn")
var deckel_friend = preload("res://characters/friends/deckel_friend.tscn")
var schloss_enemy = preload("res://characters/enemies/schloss_enemy.tscn")
var prevMob = ""
var timeadded1 = false
var timeadded2 = false
var timeadded3 = false

var spawningPoints = [Vector2(2300, 315), 
	Vector2(2300, 550), Vector2(2300, 765), Vector2(2300, 965)]

func _enter_tree():
	MainScript.reset_level_data()
	
func _process(delta):
	if MainScript.score >= 50 and !timeadded1:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.5
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.5
		timeadded1 = true
	if MainScript.score >= 100 and !timeadded2:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.2
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.2
		timeadded2 = true
	if MainScript.score >= 150 and !timeadded3:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.0005
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.0005
		timeadded2 = true

func _ready():
	get_node("Music").play()
	MainScript.current_scene = "City"
	GamePlayData.playerSpeed  = 900
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	if !MainScript.levelRestart:
		get_tree().paused = true
	


func _on_EnemySpawnTimer_timeout():
	var mob
	var enemyPos = spawningPoints[randi() % 4]
	var rndFactorSpawn = randi() % 2
	if rndFactorSpawn == 0:
		mob = klappe_enemy.instance()
	elif rndFactorSpawn == 1:
		mob = schloss_enemy.instance()
	if prevMob == "schloss_enemy":
		mob = klappe_enemy.instance()
			
	prevMob = mob.name
	add_child(mob)
	mob.position = enemyPos
	mob.position.x += $Player.position.x

func _on_FriendSpawnTimer_timeout():
	var friendPos = spawningPoints[randi() % 4]
	var mob = deckel_friend.instance()
	add_child(mob)
	mob.position = friendPos
	mob.position.x += $Player.position.x

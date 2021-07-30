extends Node2D



var lohnbrief_friend = preload("res://characters/friends/lohnbrief_friend.tscn")
var patientenschluessel_friend = preload("res://characters/friends/patientenschluessel_friend.tscn")
var pflege_blob_friend = preload("res://characters/friends/pflege_blob.tscn")
var coroni_enemy = preload("res://characters/enemies/enemy_coroni.tscn")
var prevMob = ""
var timeadded1 = false
var timeadded2 = false
var timeadded3 = false

var spawningPoints = [Vector2(2300, 315), 
	Vector2(2300, 550), Vector2(2300, 765), Vector2(2300, 965)]

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	if GamePlayData.music:
		get_node("Music").play()
	MainScript.current_scene = "Caring"
	GamePlayData.playerSpeed  = GamePlayData.player_start_speed
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	$FriendSpawnTimer2.start()
	if !MainScript.levelRestart:
		get_tree().paused = true
	if GamePlayData.show_manual and !GamePlayData.score_goal_caring_reached:
		get_tree().call_group("HUD", "showManualScreen")
		GamePlayData.show_manual = false
		MainScript.save_game()
		
func _process(delta):
	if MainScript.score >= 50 and !timeadded1:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.7
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.7
		$FriendSpawnTimer2.wait_time = $FriendSpawnTimer2.wait_time / 1.7
		timeadded1 = true
	if MainScript.score >= 100 and !timeadded2:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.3
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.3
		$FriendSpawnTimer2.wait_time = $FriendSpawnTimer2.wait_time / 1.3
		timeadded2 = true
	if MainScript.score >= 150 and MainScript.score < 230:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.0005
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.0005
		$FriendSpawnTimer2.wait_time = $FriendSpawnTimer2.wait_time / 1.0005
#		timeadded2 = true



func _on_EnemySpawnTimer_timeout():
	var enemyPos = spawningPoints[randi() % 4]
	var mob = coroni_enemy.instance()
	add_child(mob)
	mob.position = enemyPos
	mob.position.x += $Player.position.x


func _on_FriendSpawnTimer_timeout():
	var mob
	var friendPos = spawningPoints[randi() % 4]
	var rndFactorSpawn = randi() % 2
	if rndFactorSpawn == 0:
		mob = patientenschluessel_friend.instance()
	elif rndFactorSpawn == 1:
		mob = lohnbrief_friend.instance()
	if prevMob == "lohnbrief_friend":
		mob = patientenschluessel_friend.instance()
		
	prevMob = mob.name
	add_child(mob)
	mob.position = friendPos
	mob.position.x += $Player.position.x


func _on_FriendSpawnTimer2_timeout():
	var mob
	var friendPos = spawningPoints[randi() % 4]
	mob = pflege_blob_friend.instance()

	add_child(mob)
	mob.position = friendPos
	mob.position.x += $Player.position.x

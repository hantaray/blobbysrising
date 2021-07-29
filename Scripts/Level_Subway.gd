extends Node2D



var enemy_interblobexpress = preload("res://characters/enemies/enemy_interBlobExpress.tscn")
var enemy_ticket = preload("res://characters/enemies/enemy_ticket.tscn")
var friend_station_sign = preload("res://characters/friends/friend_station_sign.tscn")
var friend_screw = preload("res://characters/friends/friend_screw.tscn")
var prevMob = ""
var timeadded1 = false
var timeadded2 = false
var timeadded3 = false

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	if GamePlayData.music:
		get_node("Music").play()
	MainScript.current_scene = "Subway"
	GamePlayData.playerSpeed  = GamePlayData.player_start_speed
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	if !MainScript.levelRestart:
		get_tree().paused = true
	if GamePlayData.show_manual and !GamePlayData.score_goal_subway_reached:
		get_tree().call_group("HUD", "showManualScreen")
		GamePlayData.show_manual = false
		MainScript.save_game()
		
func _process(delta):
	if MainScript.score >= 50 and !timeadded1:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.7
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.7
		timeadded1 = true
	if MainScript.score >= 100 and !timeadded2:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.3
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.3
		timeadded2 = true
	if MainScript.score >= 150 and !timeadded3:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.0005
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.0005
		timeadded2 = true

func _on_EnemySpawnTimer_timeout():
	var mob
	var rndFactorSpawn = randi() % 2
	if rndFactorSpawn == 0:
		mob = enemy_ticket.instance()
	elif rndFactorSpawn == 1:
		mob = enemy_interblobexpress.instance()
	if prevMob == "enemy_interBlobExpress":
		mob = enemy_ticket.instance()
		
	prevMob = mob.name
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x


func _on_FriendSpawnTimer_timeout():
	$SpawnPath/SpawnLocation.offset = randi()
	var mob = friend_station_sign.instance()
	# rnd spawning for second friend
	var rndFactorFriend = randi() % 2
	if rndFactorFriend == 0:
		mob = friend_screw.instance()
	add_child(mob)
	mob.position = $SpawnPath/SpawnLocation.position
	mob.position.x += $Player.position.x

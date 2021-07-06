extends Node2D


var enemyTank = preload("res://characters/enemies/Enemy_Tank.tscn")
var friendDove = preload("res://characters/friends/Friend_Dove.tscn")
var enemyBouncyBlob = preload("res://characters/enemies/Enemy_Gun.tscn")
var prevMob = ""
var timeadded1 = false
var timeadded2 = false
var timeadded3 = false

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	if GamePlayData.music:
		get_node("Music").play()
	MainScript.current_scene = "Peace"
	GamePlayData.playerSpeed  = 900
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	if !MainScript.levelRestart:
		get_tree().paused = true
		
func _process(delta):
	if MainScript.score >= 50 and !timeadded1:
#		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.7
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.3
		timeadded1 = true
	if MainScript.score >= 100 and !timeadded2:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.1
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.1
		timeadded2 = true
	if MainScript.score >= 150 and !timeadded3:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.0005
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.0005
		timeadded2 = true

func _on_EnemySpawnTimer_timeout():
	var mob
	$SpawnPath/SpawnLocation.offset = randi()
	var rndFactorSpawn = randi() % 2
	if rndFactorSpawn == 0:
		mob = enemyTank.instance()
	elif rndFactorSpawn == 1:
		mob = enemyBouncyBlob.instance()
	print(prevMob)
	if prevMob == "enemy_gun":
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

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# quitting app or back-button on Android
		if $HUD:
			$HUD.showPauseScreen()
	if what == MainLoop.NOTIFICATION_WM_FOCUS_OUT && OS.get_name().nocasecmp_to("windows") != 0:
		# switched to different app
		if $HUD:
			$HUD.showPauseScreen()
		
		

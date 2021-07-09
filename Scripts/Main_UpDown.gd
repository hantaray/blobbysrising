extends Node2D


var enemy_truck = preload("res://characters/enemies/enemy_truck.tscn")
var enemy_klein_auto = preload("res://characters/enemies/autoKlein_enemy.tscn")
var enemy_schlagloch = preload("res://characters/enemies/enemy_schlagloch.tscn")
var enemy_spur_blocker = preload("res://characters/enemies/enemy_spur_blocker.tscn")
var friend_fahrrad_schild = preload("res://characters/friends/friend_fahrradschild.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0
var enemySpawnTopCounter = 0
var enemySpawnDownCounter = 0
var timeadded1 = false
var timeadded2 = false
var timeadded3 = false

var spawningPointsFriend = [Vector2(1400, 250), \
							Vector2(1400, 820)]
var spawningPointsEnemy = [Vector2(-1500, 250), \
							Vector2(-1500, 820)]

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	if GamePlayData.music:
		get_node("Music").play()
	MainScript.current_scene = "Street"
	GamePlayData.playerSpeed  = GamePlayData.player_start_speed
	GamePlayData.enemyCarSpeed  = GamePlayData.enemy_car_start_speed
	GamePlayData.enemyTruckSpeed  = GamePlayData.enemy_truck_start_speed
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	if !MainScript.levelRestart:
		get_tree().paused = true
		
# warning-ignore:unused_argument
func _process(delta):
#	if MainScript.score >= 50 and !timeadded1:
#		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.7
#		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.3
#		timeadded1 = true
	if MainScript.score >= 100 and !timeadded2:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.1
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.1
		timeadded2 = true
	if MainScript.score >= 150 and !timeadded3:
		$EnemySpawnTimer.wait_time = $EnemySpawnTimer.wait_time / 1.0005
		$FriendSpawnTimer.wait_time = $FriendSpawnTimer.wait_time / 1.0005
		timeadded2 = true

func _on_FriendSpawnTimer_timeout():
	spawn_friend()
	
func _on_EnemySpawnTimer_timeout():
	spawn_enemy()

func spawn_enemy():
	var mob
	var spawningPos = spawningPointsEnemy[randi() % 2]
	if spawningPos == spawningPointsEnemy[0]:
		enemySpawnTopCounter += 1
		enemySpawnDownCounter = 0
	else:
		enemySpawnDownCounter += 1
		enemySpawnTopCounter = 0
		
	# Make Top/Down spawning more random
	if enemySpawnTopCounter >= 3:
		spawningPos = spawningPointsEnemy[1]
		enemySpawnTopCounter = 0
	if enemySpawnDownCounter >= 3:
		spawningPos = spawningPointsEnemy[0]
		enemySpawnDownCounter = 0
		
	var rndFactorSpawn = randi() % 2
	if rndFactorSpawn == 0:
		mob = enemy_klein_auto.instance()
	elif rndFactorSpawn == 1:
		mob = enemy_truck.instance()
	if prevMob == "enemy_truck":
		mob = enemy_klein_auto.instance()
		
	prevMob = mob.name
	add_child(mob)
	mob.position = spawningPos
	mob.position.x = $Player.position.x - 1200
	
func spawn_friend():
	var spawningPos = spawningPointsFriend[randi() % 2]
	var mob = friend_fahrrad_schild.instance()
	var rndBlockerSpawn = randi() % 2
	var blocker = enemy_schlagloch.instance()
	if rndBlockerSpawn == 0:
		blocker = enemy_spur_blocker.instance()
	add_child(mob)
	blocker.position.x = mob.position.x
	mob.position = spawningPos
	if mob.position.y > 545:
		blocker.position.y = -280
	else:
		blocker.position.y = 280
	mob.add_child(blocker)
	mob.z_index = -1
	mob.position.x += $Player.position.x

#	add_child(mob)
#	add_child(mob)
#	mob.position.x = $Player.position.x + 1200

extends Node2D



var lohnbrief_friend = preload("res://characters/friends/lohnbrief_friend.tscn")
var patientenschluessel_friend = preload("res://characters/friends/patientenschluessel_friend.tscn")
var pflege_blob_friend = preload("res://characters/friends/pflege_blob.tscn")
var coroni_enemy = preload("res://characters/enemies/enemy_coroni.tscn")
var prevMob = ""
var noFriendSpawnCounter = 0

var spawningPoints = [Vector2(2300, 115), Vector2(2300, 315), 
	Vector2(2300, 550), Vector2(2300, 765), Vector2(2300, 965)]

func _enter_tree():
	MainScript.reset_level_data()

func _ready():
	get_node("Music").play()
	MainScript.current_scene = "Caring"
	GamePlayData.playerSpeed  = 900
	randomize()
	$EnemySpawnTimer.start()
	$FriendSpawnTimer.start()
	$FriendSpawnTimer2.start()
	get_tree().paused = true
	


func _on_EnemySpawnTimer_timeout():
	var enemyPos = spawningPoints[randi() % 5]
	var mob = coroni_enemy.instance()
	add_child(mob)
	mob.position = enemyPos
	mob.position.x += $Player.position.x


func _on_FriendSpawnTimer_timeout():
	var mob
	var friendPos = spawningPoints[randi() % 5]
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
	var friendPos = spawningPoints[randi() % 5]
	mob = pflege_blob_friend.instance()

	add_child(mob)
	mob.position = friendPos
	mob.position.x += $Player.position.x


##### Player Up Down ######

extends KinematicBody2D

var motion = Vector2(0,0)
var SPEED = 600
const GRAVITY = 25
const UP = Vector2(0,-1)

var showEnemyHitAnimation = false
const enemyHitAnimationTime = GamePlayData.INVULNERABLE_TIME
var showFriendHitAnimation = false
const friendHitAnimationTime = GamePlayData.FRIEND_HIT_ANIMATION_TIME

signal animate

var screenIsTouched = false

var pauseBtnArea

func _ready():
	var pauseBtn = \
	get_tree().get_root().get_node("UpDownMovement/HUD/HBoxContainer/TextureButton")
	pauseBtnArea = Rect2(0,0, pauseBtn.get_normal_texture().get_height(), \
							pauseBtn.get_normal_texture().get_width())
	add_to_group('Player')
	$Player_UpDown_Animation.play("idle")
 

# warning-ignore:unused_argument
func _physics_process(delta):
	SPEED = GamePlayData.playerSpeed
	move_forward()
	apply_gravity()
# warning-ignore:return_value_discarded
#	animate()
	move_and_slide(motion, UP)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screenIsTouched = true
			var TouchPoint = event.get_position()
			if TouchPoint.y < 545  \
			and !(pauseBtnArea.has_point(TouchPoint)):
				$MoveSound.play()
				position.y = 240
			if TouchPoint.y > 545  \
			and !(pauseBtnArea.has_point(TouchPoint)):
				$MoveSound.play()
				position.y = 820
		else:
			screenIsTouched = false

func move_forward():
	motion.x = SPEED

func apply_gravity():
	if !screenIsTouched:
		if position.y < 545:
			position.y += GRAVITY
		if position.y > 545:
			position.y -= GRAVITY

func increase_move_speed():
	GamePlayData.playerSpeed += GamePlayData.speed_increase_up_down
	GamePlayData.enemyTruckSpeed += GamePlayData.speed_increase_up_down
	GamePlayData.enemyLkwSpeed += GamePlayData.speed_increase_up_down
	GamePlayData.enemyCarSpeed += GamePlayData.speed_increase_up_down
#	SPEED += GamePlayData.speed_increase_up_down


func animate():
	emit_signal("animate", showEnemyHitAnimation, showFriendHitAnimation)

func play_enemy_hit_animation():
	showEnemyHitAnimation = true
	$Player_UpDown_Animation.play("hitEnemy")
	yield(get_tree().create_timer(enemyHitAnimationTime), "timeout")
	$Player_UpDown_Animation.play("idle")
	showEnemyHitAnimation = false

func play_friend_hit_animation():
	if !showEnemyHitAnimation:
		showFriendHitAnimation = true
		$Player_UpDown_Animation.play("hitFriend")
		yield(get_tree().create_timer(friendHitAnimationTime), "timeout")
		$Player_UpDown_Animation.play("idle")
		showFriendHitAnimation = false

func play_friend_hit_sound():
	var sound = get_node("Sound")
	sound.stream = load("res://Audio/collect.mp3")
	sound.play()
	
func play_enemy_hit_sound():
	var sound = get_node("Sound")
	sound.stream = load("res://Audio/hit.mp3")
	sound.play()







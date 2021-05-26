
##### Player just jump #####

extends KinematicBody2D

var motion = Vector2(0,0)
var SPEED = 600
const JUMP_SPEED = 1800
const JUMP_SPEED_X = 1200
const GRAVITY = 100
const GRAVITY_X = 25
const GRAVITY_STOP = 800
const UP = Vector2(0,-1)



var isOnFloor = false

var showEnemyHitAnimation = false
const enemyHitAnimationTime = GamePlayData.INVULNERABLE_TIME
var showFriendHitAnimation = false
const friendHitAnimationTime = GamePlayData.FRIEND_HIT_ANIMATION_TIME

signal animate

func _ready():
	add_to_group('Player')
 

# warning-ignore:unused_argument
func _physics_process(delta):
	SPEED = GamePlayData.playerSpeed
	if is_on_floor():
		isOnFloor = true
	else:
		isOnFloor = false
	move_forward()
	if not MainScript.pause_button_pressed:
		jump()
	apply_gravity()
	animate()
	# warning-ignore:return_value_discarded
	move_and_slide(motion, UP)

func move_forward():
	motion.x = SPEED

func jump():
	if Input.is_action_just_pressed("jump"):
		$JumpSound.play()
		motion.y = JUMP_SPEED * -1
		motion.x += JUMP_SPEED_X


func apply_gravity():
	if motion.y <= GRAVITY_STOP:
		motion.y += GRAVITY
	if motion.y >= SPEED:
		motion.y -= GRAVITY_X
	# give max gravity
	# motion.y = max(motion.y, GRAVITY_STOP)
	# play with a little x push and the camera smoothing and drag marging

func animate():
	emit_signal("animate", motion, isOnFloor, showEnemyHitAnimation, showFriendHitAnimation)

func play_enemy_hit_animation():
	showEnemyHitAnimation = true
	yield(get_tree().create_timer(enemyHitAnimationTime), "timeout")
	showEnemyHitAnimation = false

func play_friend_hit_animation():
	showFriendHitAnimation = true
	yield(get_tree().create_timer(friendHitAnimationTime), "timeout")
	showFriendHitAnimation = false

func play_friend_hit_sound():
	var sound = get_node("Sound")
	sound.stream = load("res://Audio/collect.wav")
	sound.play()

func play_enemy_hit_sound():
	var sound = get_node("Sound")
	sound.stream = load("res://Audio/hit.wav")
	sound.play()

func increase_move_speed():
	GamePlayData.playerSpeed += GamePlayData.speed_increase_just_jump
#	SPEED += GamePlayData.speed_increase_just_jump









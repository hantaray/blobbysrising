extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 600
const JUMP_SPEED_X = 1200
const JUMP_SPEED = 4000
const GRAVITY = 50
const GRAVITY_X = 25
const GRAVITY_STOP = 400
const UP = Vector2(0,-1)

var isOnFloor = false

signal anmiate

onready var game_started = false
 

func _physics_process(delta):
	if is_on_floor():
		isOnFloor = true
	else:
		isOnFloor = false
	move_forward()
	jump()
	apply_gravity()
	animate()
	move_and_slide(motion, UP)

func move_forward():
	if game_started:
		motion.x = SPEED

func jump():
	if Input.is_action_pressed("up"):
		position.y = 50
		game_started = true
	elif Input.is_action_pressed("down"):
		position.y = 950
		game_started = true
	

func apply_gravity():
	if position.y < 550:
		position.y += GRAVITY
	if position.y > 550:
		position.y -= GRAVITY

func animate():
	emit_signal("anmiate", motion, isOnFloor)
	
func gameOver():
	hide()







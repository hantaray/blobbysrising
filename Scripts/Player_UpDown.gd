extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 600
const GRAVITY = 50
const UP = Vector2(0,-1)

var isOnFloor = true

signal anmiate

onready var game_started = false
 

func _physics_process(delta):
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







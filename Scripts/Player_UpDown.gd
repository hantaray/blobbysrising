extends KinematicBody2D

var motion = Vector2(0,0)
var SPEED = 600
const GRAVITY = 50
const UP = Vector2(0,-1)

var isOnFloor = true

signal anmiate

onready var game_started = false

var screenIsTouched = false
 

func _physics_process(delta):
	move_forward()
	apply_gravity()
	animate()
	move_and_slide(motion, UP)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screenIsTouched = true
			var TouchPoint = event.get_position()

			if TouchPoint.y < 550:
				position.y = 50
				game_started = true
			if TouchPoint.y > 550:
				position.y = 950
				game_started = true
		else:
			screenIsTouched = false

func move_forward():
	if game_started:
		motion.x = SPEED

func apply_gravity():
	if !screenIsTouched:
		if position.y < 550:
			position.y += GRAVITY
		if position.y > 550:
			position.y -= GRAVITY

func animate():
	emit_signal("anmiate", motion, isOnFloor)

func gameOver():
	hide()







extends KinematicBody2D

onready var screen_width = OS.get_screen_size().x
onready var screen_height = OS.get_screen_size().y

onready var MoveUpArea = Rect2(0, 0, screen_width, screen_height/2)
onready var MoveDownArea = Rect2(0, screen_height/2, screen_width, screen_height)

var motion = Vector2(0,0)
const SPEED = 600
const GRAVITY = 50
const UP = Vector2(0,-1)

var isOnFloor = true

signal anmiate

onready var game_started = false

var screenIsTouched = false
 

func _physics_process(delta):
	move_forward()
	animate()
	move_and_slide(motion, UP)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screenIsTouched = true
			var TouchPoint = event.get_position()

			if position.y > 150:
				if MoveUpArea.has_point(TouchPoint):
					position.y -= 200
					game_started = true
			if position.y < 850:
				if MoveDownArea.has_point(TouchPoint):
					position.y += 200
					game_started = true
		else:
			screenIsTouched = false

func move_forward():
	if game_started:
		motion.x = SPEED

func animate():
	emit_signal("anmiate", motion, isOnFloor)

func gameOver():
	hide()







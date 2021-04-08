
##### Player Up Down ######

extends KinematicBody2D

var motion = Vector2(0,0)
var SPEED = 600
const GRAVITY = 25
const UP = Vector2(0,-1)

var isOnFloor = true

var screenIsTouched = false

func _ready():
	add_to_group('Player')
 

func _physics_process(delta):
	SPEED = GamePlayData.playerSpeed
	move_forward()
	apply_gravity()
	move_and_slide(motion, UP)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screenIsTouched = true
			var TouchPoint = event.get_position()
			if TouchPoint.y < 550:
				position.y = 275
			if TouchPoint.y > 550:
				position.y = 825
		else:
			screenIsTouched = false

func move_forward():
	motion.x = SPEED

func apply_gravity():
	if !screenIsTouched:
		if position.y < 550:
			position.y += GRAVITY
		if position.y > 550:
			position.y -= GRAVITY

func increase_move_speed():
	SPEED += GamePlayData.speed_increase_up_down







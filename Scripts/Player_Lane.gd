#### Player Lane ####



extends KinematicBody2D

onready var screen_width = get_tree().get_root().get_viewport().size.x
onready var screen_height = get_tree().get_root().get_viewport().size.y

onready var MoveUpArea = Rect2(0, 0, screen_width, screen_height/2)
onready var MoveDownArea = Rect2(0, screen_height/2, screen_width, screen_height)

var motion = Vector2(0,0)
var SPEED = 600
const GRAVITY = 50
const UP = Vector2(0,-1)

var isOnFloor = true

signal anmiate

var screenIsTouched = false
 
func _ready():
	add_to_group('Player')


func _physics_process(delta):
	move_forward()
	animate()
	move_and_slide(motion, UP)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screenIsTouched = true
			var TouchPoint = event.get_position()
			if position.y > 200:
				if MoveUpArea.has_point(TouchPoint):
					position.y -= 200
			if position.y < 850:
				if MoveDownArea.has_point(TouchPoint):
					position.y += 200
		else:
			screenIsTouched = false

func move_forward():
	motion.x = SPEED

func animate():
	emit_signal("anmiate", motion, isOnFloor)

func increase_move_speed():
	SPEED += GamePlayData.speed_increase_lane






#### Player Lane ####



extends KinematicBody2D

onready var screen_width = get_tree().get_root().get_viewport().size.x
onready var screen_height = get_tree().get_root().get_viewport().size.y

var shape_height = 0

var motion = Vector2(0,0)
var SPEED = 600
const GRAVITY = 50
const UP = Vector2(0,-1)

var isOnFloor = true

signal anmiate

var screenIsTouched = false
 
func _ready():
	shape_height = $CollisionShape2D.shape.height
	add_to_group('Player')


func _physics_process(delta):
	move_forward()
	move_and_slide(motion, UP)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screenIsTouched = true
			var TouchPoint = event.get_position()
			# UpMovement
			# TopScreenBorder
			if position.y > 200 and TouchPoint.y < position.y + shape_height/2:
				position.y -= 200
			# DownMovement
			# ButtomScreenBorder
			elif position.y < 850 and TouchPoint.y > position.y + shape_height/2:
				position.y += 200
		else:
			screenIsTouched = false

func move_forward():
	motion.x = SPEED

func increase_move_speed():
	SPEED += GamePlayData.speed_increase_lane






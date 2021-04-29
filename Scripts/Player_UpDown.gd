
##### Player Up Down ######

extends KinematicBody2D

var motion = Vector2(0,0)
var SPEED = 600
const GRAVITY = 25
const UP = Vector2(0,-1)

var isOnFloor = true

var screenIsTouched = false

var pauseBtnArea

func _ready():
	var pauseBtn = \
	get_tree().get_root().get_node("UpDownMovement/HUD/HBoxContainer/TextureButton")
	pauseBtnArea = Rect2(0,0, pauseBtn.get_normal_texture().get_height(), \
							pauseBtn.get_normal_texture().get_width())
	add_to_group('Player')
 

# warning-ignore:unused_argument
func _physics_process(delta):
	SPEED = GamePlayData.playerSpeed
	move_forward()
	apply_gravity()
# warning-ignore:return_value_discarded
	move_and_slide(motion, UP)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screenIsTouched = true
			var TouchPoint = event.get_position()
			if TouchPoint.y < 545  \
			and !(pauseBtnArea.has_point(TouchPoint)):
				position.y = 280
			if TouchPoint.y > 545  \
			and !(pauseBtnArea.has_point(TouchPoint)):
				position.y = 790
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
	SPEED += GamePlayData.speed_increase_up_down







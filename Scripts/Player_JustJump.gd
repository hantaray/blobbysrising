extends KinematicBody2D

var motion = Vector2(0,0)
var SPEED = 600
const JUMP_SPEED_X = 1200
const JUMP_SPEED = 1400
const GRAVITY = 70
const GRAVITY_X = 25
const GRAVITY_STOP = 400
const UP = Vector2(0,-1)

var isOnFloor = false

signal animate
 

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
	motion.x = SPEED

func jump():
	if Input.is_action_just_pressed("jump"):
		motion.y = JUMP_SPEED * -1
		motion.x += JUMP_SPEED_X;
		


func apply_gravity():
	if motion.y <= GRAVITY_STOP:
		motion.y += GRAVITY
	if motion.y >= SPEED:
		motion.y -= GRAVITY_X
	# give max gravity
	# motion.y = max(motion.y, GRAVITY_STOP)
	# play with a little x push and the camera smoothing and drag marging

func animate():
	emit_signal("animate", motion, isOnFloor)
	
func gameOver():
	hide()







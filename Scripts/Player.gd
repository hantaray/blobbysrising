extends KinematicBody2D

var input_direction = 0
var direction = 0
 
var speed_x = 0
var velocity = Vector2()
 
const MAX_SPEED = 600
const ACCELERATION = 1000
const DECELERATION = 2000
 
 
func _ready():
	set_process(true)
	set_process_input(true)
 
 
func _input(event):
	pass
 
 
func _process(delta):
	# INPUT
	if input_direction:
		direction = input_direction
 
	if Input.is_action_pressed('up'):
		input_direction = -1
	elif Input.is_action_pressed('down'):
		input_direction = 1
	else:
		input_direction = 0
 
	# MOVEMENT
	if input_direction == - direction:
		speed_x /= 3
	if input_direction:
		speed_x += ACCELERATION * delta
	else:
		speed_x -= DECELERATION * delta
	speed_x = clamp(speed_x, 0, MAX_SPEED)
 
	velocity.y = 100
	move_and_slide(velocity)
#
#onready var screen_width = OS.get_screen_size().x
#onready var screen_height = OS.get_screen_size().y
#
#onready var MoveUpArea = Rect2(0, 0, screen_width, screen_height/2)
#onready var MoveDownArea = Rect2(screen_height/2, 0, screen_width, screen_height)
#
#const JUMPFORCE = 800
#const GRAVITY = 2000
#
##var velocity = Vector2(0.0, 0.0)
##var speed = 100
###
##onready var player = get_node("KinematicBody2D")
##
##func _input(event):
##	if event is InputEventScreenTouch:
##		if event.is_pressed():
##			var TouchPoint = event.get_position()
##
##			if MoveUpArea.has_point(TouchPoint):
##				velocity.y -= speed
##			if MoveDownArea.has_point(TouchPoint):
##				velocity.y += speed
##		else:
##			velocity = Vector2(0.0, 0.0)
##    elif event is InputEventScreenDrag:
##        direction = player.to_local(event.position).normalized()
##
##func _process(delta):
##    position = position + direction * speed * delta
#
#export (int) var speed = 4000
##
#var velocity = Vector2()
##
##var direction
##var move
##
#func get_input():
#	velocity = Vector2()
##	if direction == "down":
#	if Input.is_action_pressed('down'):
##		if position.y <= 300:
#		velocity.y = 1
##	if direction == "up":
#	if Input.is_action_pressed('up'):
##		if position.y >= -230:
#		velocity.y -= 1
#	velocity = velocity.normalized() * speed
##
##func _input(event):
##	if event is InputEventScreenTouch:
##		if event.is_pressed():
##			if event.position.y > OS.get_screen_size().y / 2:
##				velocity.y += 1
##			elif event.position.y < OS.get_screen_size().y / 2:
##				velocity.y -= 1
##		else:
##			velocity = Vector2(0.0, 0.0)
##	elif event is InputEventScreenDrag:
##		velocity.y += -1
##
#func _physics_process(delta):
#	print(position)
##	$Label.text = str(position)
#	var curPos =  position
#	curPos.x = curPos.x + 100 * delta
#	position =  curPos
#
#	get_input()
##	if move:
#	velocity = move_and_slide(velocity)
#	position.y = 100
##	else:
##		velocity = Vector2(0.0, 0.0)

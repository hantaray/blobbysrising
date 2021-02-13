extends KinematicBody2D

onready var screen_width = OS.get_screen_size().x
onready var screen_height = OS.get_screen_size().y

onready var MoveUpArea = Rect2(0, 0, screen_width, screen_height/2)
onready var MoveDownArea = Rect2(screen_height/2, 0, screen_width, screen_height)

#var velocity = Vector2(0.0, 0.0)
#var speed = 100
##
#onready var player = get_node("KinematicBody2D")
#
#func _input(event):
#	if event is InputEventScreenTouch:
#		if event.is_pressed():
#			var TouchPoint = event.get_position()
#
#			if MoveUpArea.has_point(TouchPoint):
#				velocity.y -= speed
#			if MoveDownArea.has_point(TouchPoint):
#				velocity.y += speed
#		else:
#			velocity = Vector2(0.0, 0.0)
#    elif event is InputEventScreenDrag:
#        direction = player.to_local(event.position).normalized()
#
#func _process(delta):
#    position = position + direction * speed * delta

export (int) var speed = 400
#
var velocity = Vector2()
#
#var direction
#var move
#
func get_input():
	velocity = Vector2()
#	if direction == "down":
	if Input.is_action_pressed('down'):
#		if position.y <= 300:
		velocity.y += 1
#	if direction == "up":
	if Input.is_action_pressed('up'):
#		if position.y >= -230:
		velocity.y -= 1
	velocity = velocity.normalized() * speed
#
#func _input(event):
#	if event is InputEventScreenTouch:
#		if event.is_pressed():
#			if event.position.y > OS.get_screen_size().y / 2:
#				velocity.y += 1
#			elif event.position.y < OS.get_screen_size().y / 2:
#				velocity.y -= 1
#		else:
#			velocity = Vector2(0.0, 0.0)
#	elif event is InputEventScreenDrag:
#		velocity.y += -1
#
func _physics_process(delta):
#	print(screenSize)
#	$Label.text = str(position)
	var curPos =  position
	curPos.x = curPos.x + 100 * delta
	position =  curPos
#
	get_input()
#	if move:
	velocity = move_and_slide(velocity)
#	else:
#		velocity = Vector2(0.0, 0.0)

extends KinematicBody2D

export (int) var speed = 400

var velocity = Vector2()

var direction
var move

func get_input(direction):
	velocity = Vector2()
	if direction == "down":
		if position.y <= 300:
			velocity.y += 1
	if direction == "up":
		if position.y >= -230:
			velocity.y -= 1
	velocity = velocity.normalized() * speed
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			move = true
			if event.position.y > OS.get_screen_size().y / 2:
				direction = "down"
			elif event.position.y < OS.get_screen_size().y / 2:
				direction = "up"
		else:
			move = false
#			velocity = Vector2(0.0, 0.0)
#	elif event is InputEventScreenDrag:
#		velocity.y += -1

func _physics_process(delta):
	$Label.text = str(position)
	var curPos =  position
	curPos.x = curPos.x + 100 * delta
	position =  curPos

	get_input(direction)
	if move:
		velocity = move_and_slide(velocity)
	else:
		velocity = Vector2(0.0, 0.0)

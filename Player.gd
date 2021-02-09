extends KinematicBody2D

export (int) var speed = 400

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('down'):
		if position.y <= 200:
			velocity.y += 1
	if Input.is_action_pressed('up'):
		if position.y >= -226:
			velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	print(position.y)
	var curPos =  position
	curPos.x = curPos.x + 100 * delta
	position =  curPos
	
	get_input()
	velocity = move_and_slide(velocity)

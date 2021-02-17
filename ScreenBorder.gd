extends StaticBody2D

func _physics_process(delta):
	var curPos =  position
	curPos.x = curPos.x + 600 * delta
	position =  curPos

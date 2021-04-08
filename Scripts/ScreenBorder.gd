extends StaticBody2D

# warning-ignore:unused_argument
func _physics_process(delta):
	var playerPos = get_node('../Player').position
	position.x =  playerPos.x

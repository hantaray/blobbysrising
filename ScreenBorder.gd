extends StaticBody2D

func _physics_process(delta):
	var playerPos = get_node('../Player_JustJump').position
	position.x =  playerPos.x

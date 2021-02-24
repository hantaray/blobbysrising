extends StaticBody2D

func _physics_process(delta):
	var playerPos = get_node('../Player_UpDown').position
	position.x =  playerPos.x

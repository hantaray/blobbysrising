extends StaticBody2D

# warning-ignore:unused_argument
func _physics_process(delta):
	var player = get_tree().get_nodes_in_group("Player").front()
	if player != null: 
		position.x = player.position.x
#	var playerPos = get_node('../Player').position
#	position.x =  playerPos.x

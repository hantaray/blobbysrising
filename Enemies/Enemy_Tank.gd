extends Area2dMovement






func _on_Enemy_Tank_body_entered(body):
	if body.name == "Player_JustJump" or body.name == "Player_UpDown":
		var main = get_node('../')
		main.decrease_score()
		hide()

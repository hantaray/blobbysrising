extends Area2dMovement



func _on_Friend_Dove_body_entered(body):
	if body.name == "Player":
		var main = get_node('../')
		main.increase_score()
		hide()

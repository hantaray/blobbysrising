extends Area2dMovement




func _on_Enemy_BouncyBlob_body_entered(body):
	if body.name == "ScreenBorder":
		velocity.y *= -1
	if body.name == "Player":
		var main = get_node('../')
		main.decrease_score(3)
		hide()

extends Area2dFriend



func _on_Friend_Dove_body_entered(body):
	#if body.name == "Player":
	var main = get_node('../')
	main.increase_score()
	queue_free()
		# vielleicht queue_free() statt hide da es die instance des objekts komplett entfernt

extends Area2dFriend



func _on_deckel_friend_body_entered(body):
	if body.name == "Player":
		MainScript.increase_score()
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()

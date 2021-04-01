extends Area2dFriend



func _on_Friend_Dove_body_entered(body):
	if body.name == "Player":		
		MainScript.increase_score()
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()


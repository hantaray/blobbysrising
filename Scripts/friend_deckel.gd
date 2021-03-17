extends Area2dFriend



func _on_deckel_friend_body_entered(body):
	var main = get_node('../')
	main.increase_score()
	queue_free()

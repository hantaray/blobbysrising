extends Area2dEnemy


func _on_Enemy_Tank_body_entered(body):
	friend_collides(body)

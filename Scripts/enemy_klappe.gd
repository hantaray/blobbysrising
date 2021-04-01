extends Area2dEnemy


func _on_klappe_enemy_body_entered(body):
	friend_collides(body)

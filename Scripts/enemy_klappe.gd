extends Area2dEnemy



func _on_klappe_enemy_body_entered(body):
	var main = get_node('../')
	main.increase_score()
	queue_free()

extends Area2dEnemy



func _on_klappe_enemy_body_entered(body):
	get_tree().call_group("HUD", "decrease_lives", life_damage)
	queue_free()

extends Area2dEnemy





func _on_enemy_wolke_body_entered(body):
	get_tree().call_group("HUD", "decrease_lives", life_damage)
	queue_free()

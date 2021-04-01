extends Area2dEnemy





func _on_enemy_wolke_body_entered(body):
	if body.name == "Player":
	#var main = get_node('../')
	#main.decrease_score(2)
		MainScript.decrease_lives(life_damage)
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()

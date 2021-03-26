extends Area2dEnemy

func _physics_process(delta):
	speed_x = MainScript.enemyCarSpeed

func _on_autoKlein_enemy_body_entered(body):
	if body.name == "Player":
	#var main = get_node('../')
	#main.decrease_score(2)
		get_tree().call_group("HUD", "decrease_lives", life_damage)
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()

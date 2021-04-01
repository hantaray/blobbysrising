extends Area2dEnemy

export (int) var rotationSpeed = 5

func _process(delta):
	rotate(rotationSpeed * delta)


func _on_schloss_enemy_body_entered(body):
	if body.name == "Player":
	#var main = get_node('../')
	#main.decrease_score(2)
		MainScript.decrease_lives(life_damage)
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()

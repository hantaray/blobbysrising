extends Area2dEnemy

var wolke = preload("res://characters/enemies/enemy_wolke.tscn")

func _physics_process(delta):
	velocity = Vector2(MainScript.enemyTruckSpeed,speed_y)

func _on_Timer_timeout():
	if $VisibilityNotifier2D.is_on_screen():
		var wolke_inst = wolke.instance()
		var parent = get_parent()
		if parent != null:
			parent.add_child(wolke_inst)
			var wolke_pos = position
			wolke_pos.x -= 100
			wolke_inst.position = wolke_pos


func _on_enemy_truck_body_entered(body):
	if body.name == "Player":
	#var main = get_node('../')
	#main.decrease_score(2)
		get_tree().call_group("HUD", "decrease_lives", life_damage)
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()

extends Area2dEnemy

var wolke = preload("res://characters/enemies/enemy_wolke.tscn")

func _on_Timer_timeout():
	var wolke_inst = wolke.instance()
	var parent = get_parent()
	if parent != null:
		parent.add_child(wolke_inst)
		var wolke_pos = position
		wolke_pos.x -= 100
		wolke_inst.position = wolke_pos


func _on_enemy_truck_body_entered(body):
	get_tree().call_group("HUD", "decrease_lives", life_damage)
	queue_free()

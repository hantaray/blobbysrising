extends Area2dMovement

var life_damage = 1

func _on_Enemy_Tank_body_entered(body):
	if body.name == "Player":
		#var main = get_node('../')
		#main.decrease_score(2)
		get_tree().call_group("HUD", "decrease_lives", life_damage)
		hide()

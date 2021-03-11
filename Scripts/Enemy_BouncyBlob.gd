extends Area2dMovement

var life_damage = 2


func _on_Enemy_BouncyBlob_body_entered(body):
	if body.name == "ScreenBorder":
		velocity.y *= -1
	if body.name == "Player":
		#var main = get_node('../')
		#main.decrease_score(3)
		get_tree().call_group("HUD", "decrease_lives", life_damage)
		hide()

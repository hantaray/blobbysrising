extends Area2dEnemy

func _ready():
	life_damage = 2

func _on_Enemy_BouncyBlob_body_entered(body):
	if body.get_collision_layer_bit(3):
		velocity.y *= -1
	if body.get_collision_layer_bit(0) :
		#var main = get_node('../')
		#main.decrease_score(3)
		get_tree().call_group("HUD", "decrease_lives", life_damage)
		queue_free()

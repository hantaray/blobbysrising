extends Area2dEnemy

#func _physics_process(delta):
#	speed_y = MainScript.bouncyblob_y
	
func _ready():
	life_damage = 2

func _on_Enemy_BouncyBlob_body_entered(body):
	if body.get_collision_layer_bit(3):
		velocity.y *= -1
	if body.name == "Player":
	#var main = get_node('../')
	#main.decrease_score(2)
		#get_tree().call_group("HUD", "decrease_lives", life_damage)
		MainScript.decrease_lives(life_damage)
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()

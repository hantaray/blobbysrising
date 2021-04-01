extends Area2dEnemy

func _ready():
	life_damage = 2

func _on_Enemy_BouncyBlob_body_entered(body):
	if body.get_collision_layer_bit(3):
		velocity.y *= -1
	friend_collides(body)

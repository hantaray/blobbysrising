extends Area2dEnemy

export (int) var rotationSpeed = 5

func _process(delta):
	rotate(rotationSpeed * delta)


func _on_schloss_enemy_body_entered(body):
	friend_collides(body)


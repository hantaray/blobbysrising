extends Area2dEnemy


export (int) var rotationSpeed = 1
var swing_direction = 1
const swing_limit = 0.5

func _process(delta):
	rotate(rotationSpeed * delta * swing_direction)
	if (rotation * swing_direction) > swing_limit:
		swing_direction = swing_direction * -1

func _on_InterBlobExpress_body_entered(body):
	friend_collides(body)

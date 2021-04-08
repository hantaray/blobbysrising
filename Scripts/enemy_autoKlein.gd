extends Area2dEnemy

# warning-ignore:unused_argument
func _physics_process(delta):
	velocity = Vector2(GamePlayData.enemyTruckSpeed,speed_y)

func _on_autoKlein_enemy_body_entered(body):
	friend_collides(body)

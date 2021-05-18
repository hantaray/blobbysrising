extends Area2dFriend




func _ready():
	speed_x = GamePlayData.playerSpeed/2
	velocity = Vector2(speed_x,speed_y)

func _on_friend_geld_body_entered(body):
	friend_collides(body)
	




func _on_friend_geld_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.get_collision_layer_bit(1):
		queue_free()

extends Area2dFriend



#
func _ready():
#	speed_x = GamePlayData.playerSpeed/2
	velocity = Vector2(0,-1000)
	
	
#func _process(delta):
#	if !$VisibilityNotifier2D.is_on_screen():
#		queue_free()


func _on_friend_geld_body_entered(body):
	friend_collides(body)
#	if body.get_collision_layer_bit(0):
#	elif body.get_collision_layer_bit(4):
#		friend_collides(body)





# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_friend_geld_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.get_collision_layer_bit(1):
		queue_free()


func _on_Timer_timeout():
	velocity = Vector2(0, 1000)


func _on_Timer2_timeout():
	velocity = Vector2(0, 0)


func _on_Selfdestruct_timeout():
	queue_free()

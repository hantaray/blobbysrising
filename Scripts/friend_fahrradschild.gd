extends Area2dFriend

onready var animation = $AnimatedSprite
var intact = true


func _ready():
	animation.play("intact")




func _on_friend_fahrradschild_body_entered(body):
	friend_collides(body)
	


func _on_friend_fahrradschild_area_shape_entered(_area_id, _area, _area_shape, _self_shape):
	if _area.get_collision_layer_bit(1) and $VisibilityNotifier2D.is_on_screen():
		animation.play("broken")
		intact = false

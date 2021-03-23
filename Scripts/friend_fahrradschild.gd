extends Area2dFriend

onready var animation = $AnimatedSprite
var intact = true


func _ready():
	animation.play("intact")




func _on_friend_fahrradschild_body_entered(body):
	if body.get_collision_layer_bit(0) and intact:
		var main = get_node('../')
		main.increase_score()
		queue_free()
	


func _on_friend_fahrradschild_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.get_collision_layer_bit(1):
		animation.play("broken")
		intact = false
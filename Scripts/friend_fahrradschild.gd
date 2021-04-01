extends Area2dFriend

onready var animation = $AnimatedSprite
var intact = true


func _ready():
	animation.play("intact")




func _on_friend_fahrradschild_body_entered(body):
	if body.name == "Player" and intact:
		MainScript.increase_score()
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()
	


func _on_friend_fahrradschild_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.get_collision_layer_bit(1) and $VisibilityNotifier2D.is_on_screen():
		animation.play("broken")
		intact = false

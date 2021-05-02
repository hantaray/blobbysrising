extends Area2D
class_name Area2dFriend


export var speed_x = 0
export var speed_y = 0


onready var velocity = Vector2(speed_x,speed_y)


func _process(delta: float) -> void:
	position += velocity * delta
	
func friend_collides(body):
	if body.get_collision_layer_bit(0):
		MainScript.add_perfect_collect_counter()
		MainScript.increase_score()
		get_tree().call_group("Player", "play_friend_hit_animation")
		get_tree().call_group("Player", "play_friend_hit_sound")
		queue_free()
	elif body.get_collision_layer_bit(4):
#		MainScript.reset_perfect_collect()
		queue_free()
	


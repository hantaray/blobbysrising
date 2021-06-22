extends Area2D
class_name Area2dFriend


export var speed_x = 0
export var speed_y = 0


onready var velocity = Vector2(speed_x,speed_y)


func _process(delta: float) -> void:
	position += velocity * delta


func friend_collides(body):
	if body.get_collision_layer_bit(0):
		if is_in_group("collectible_item"):
			get_tree().call_group("Player", "collect_item", self)
			get_tree().call_group("Player", "play_friend_hit_sound")
		else:
			if is_in_group("pflege_blob"):
				get_tree().call_group("Player", "give_item")
				var player = get_tree().get_nodes_in_group("Player")
				if player[0].item_collected:
					MainScript.add_perfect_collect_counter()
					MainScript.increase_score()
					get_node("AnimatedSprite").play("move_happy")
					get_tree().call_group("Player", "play_friend_hit_sound")
			else:
				MainScript.add_perfect_collect_counter()
				MainScript.increase_score()
				get_tree().call_group("Player", "play_friend_hit_animation")
				get_tree().call_group("Player", "play_friend_hit_sound")
				queue_free()
	elif body.get_collision_layer_bit(4):
#		MainScript.reset_perfect_collect()
		queue_free()
	


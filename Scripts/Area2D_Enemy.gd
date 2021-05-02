extends Area2D
class_name Area2dEnemy


export var speed_x = -100
export var speed_y = 0

var life_damage = 1


onready var velocity = Vector2(speed_x,speed_y)


func _process(delta: float) -> void:
	position += velocity * delta
	
func friend_collides(body):
	if body.get_collision_layer_bit(0):
		MainScript.decrease_lives(life_damage)
		MainScript.reset_perfect_collect()
		get_tree().call_group("Player", "play_enemy_hit_animation")
		get_tree().call_group("Player", "play_enemy_hit_sound")
		if MainScript.check_game_over():
			MainScript.game_over()
		else:
			queue_free()
	elif body.get_collision_layer_bit(4):
		queue_free()

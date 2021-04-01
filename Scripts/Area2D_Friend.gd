extends Area2D
class_name Area2dFriend


export var speed_x = -100
export var speed_y = 0


onready var velocity = Vector2(speed_x,speed_y)


func _process(delta: float) -> void:
	position += velocity * delta
	
func friend_collides(body):
	if body.name == "Player":
		MainScript.add_perfect_collect_counter()
		MainScript.increase_score()
		queue_free()		
	elif body.name == "MobDestructionBorder":
		MainScript.reset_perfect_collect()
		queue_free()
	


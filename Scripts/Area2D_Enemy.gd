extends Area2D
class_name Area2dEnemy


export var speed_x = -100
export var speed_y = 0

var life_damage = 1


onready var velocity = Vector2(speed_x,speed_y)


func _process(delta: float) -> void:
	position += velocity * delta
	
func friend_collides(body):
	if body.name == "Player":
		MainScript.decrease_lives(life_damage)
		MainScript.reset_perfect_collect()
		queue_free()
	elif body.name == "MobDestructionBorder":
		queue_free()

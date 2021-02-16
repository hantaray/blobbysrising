extends Area2D
class_name Area2dMovement

export var speed_x = -100
export var speed_y = 0


onready var velocity = Vector2(speed_x,speed_y)


func _process(delta: float) -> void:
	position += velocity * delta
	


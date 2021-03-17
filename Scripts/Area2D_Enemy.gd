extends Area2D
class_name Area2dEnemy


export var speed_x = -100
export var speed_y = 0

var life_damage = 1


onready var velocity = Vector2(speed_x,speed_y)


func _process(delta: float) -> void:
	position += velocity * delta

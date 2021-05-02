extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var music = get_tree().get_root().get_child(0)
	print(music)
	music.stream = load("res://Audio/Casual Theme #1 (Looped).wav")
	music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

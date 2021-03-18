extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	# get_tree().change_scene("res://levels/JumpMovement.tscn")
#	# get_tree().change_scene("res://levels/UpDownMovement.tscn")
	get_tree().change_scene("res://title_screen/TitleScreen.tscn")
	# feedback for scene loaded then call HUD
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	get_tree().call_group("HUD", "update_lives_hud", lives)

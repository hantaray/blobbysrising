extends Button



func _on_StartButton_pressed():
	print("press")
	get_tree().change_scene("res://start_screen/LevelSelection.tscn")

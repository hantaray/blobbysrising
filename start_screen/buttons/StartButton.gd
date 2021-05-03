extends Button



func _on_StartButton_pressed():
	$Sound.play()
	get_tree().change_scene("res://start_screen/LevelSelection.tscn")

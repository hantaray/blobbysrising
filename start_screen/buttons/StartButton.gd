extends TextureButton



func _on_StartButton_pressed():
	$Sound.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://start_screen/LevelSelection.tscn")

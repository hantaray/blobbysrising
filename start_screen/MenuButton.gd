extends TextureButton




func _on_MenuButton_pressed():
	$Sound.play()


func _on_Sound_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://start_screen/StartScreen.tscn")

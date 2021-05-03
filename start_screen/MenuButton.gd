extends TextureButton




func _on_MenuButton_pressed():
	$Sound.play()


func _on_Sound_finished():
	get_tree().change_scene("res://start_screen/StartScreen.tscn")

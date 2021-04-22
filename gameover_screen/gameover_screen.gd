extends Control






func _on_BackButton_pressed():
	print("bbpress")
	#get_tree().change_scene("res://start_screen/StartScreen.tscn")
# warning-ignore:return_value_discarded
	get_tree().change_scene(MainScript.startscreen_path)
	get_tree().paused = false


func _on_ReplayButton_pressed():
	if MainScript.current_scene_path != null:
# warning-ignore:return_value_discarded
		get_tree().change_scene(MainScript.current_scene_path)
		get_tree().paused = false


func _on_ResumeButton_pressed():
	hide()
	get_tree().paused = false

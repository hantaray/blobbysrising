extends Control






func _on_BackButton_pressed():
	#get_tree().change_scene("res://start_screen/StartScreen.tscn")
	get_tree().change_scene(MainScript.startscreen_path)


func _on_ReplayButton_pressed():
	if MainScript.current_scene_path != null:
		get_tree().change_scene(MainScript.current_scene_path)

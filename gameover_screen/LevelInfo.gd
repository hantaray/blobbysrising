extends Control

func _ready():
	$TextureRect.self_modulate = Color(1, 1, 1, 0.9)
	get_tree().call_group("HUD", "updateLevelInfo", false)


func _on_PlayButton_pressed():
	MainScript.levelRestart = false
	$CenterContainer2/HBoxContainer/PlayButton/Sound.play()
	hide()
	get_tree().paused = false


func _on_MenuBotton_pressed():
	MainScript.levelRestart = false
	$CenterContainer2/HBoxContainer/MenuBotton/Sound.play()
	get_tree().change_scene(MainScript.levelselection_path)
	get_tree().paused = false


func _on_ReplayButton_pressed():
	MainScript.levelRestart = true
	$CenterContainer2/HBoxContainer/MenuBotton/Sound.play()
	if MainScript.current_scene_path != null:
# warning-ignore:return_value_discarded
		get_tree().change_scene(MainScript.current_scene_path)
		get_tree().paused = false

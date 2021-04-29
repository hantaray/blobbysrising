extends Control

func _ready():
	$TextureRect.self_modulate = Color(1, 1, 1, 0.9)
	get_tree().call_group("HUD", "updateLevelInfo")


func _on_PlayButton_pressed():
	hide()
	get_tree().paused = false


func _on_MenuBotton_pressed():
	get_tree().change_scene(MainScript.levelselection_path)
	get_tree().paused = false

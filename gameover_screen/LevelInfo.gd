extends Control

func _ready():
	get_tree().call_group("HUD", "updateLevelInfo")

func _on_TextureButton_pressed():
	hide()
	get_tree().paused = false

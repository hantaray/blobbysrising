extends Control

var scene_path_to_load

func _ready():
	update_buttons()
	$Menu/CenterRow/Buttons/JumpButton.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])


func _on_Button_pressed(scene_to_load):
	$FadeIn.show()
	$FadeIn.fade_in()
	scene_path_to_load = scene_to_load
	MainScript.current_scene_path = scene_to_load


func _on_FadeIn_fade_finished():
	$FadeIn.hide()
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_path_to_load)
	
func update_buttons():
	for button in $Menu/CenterRow/Buttons.get_children():
		if button.name == "JumpButton":
			if GamePlayData.locked_forest: 
				button.modulate = Color(1, 1, 1, 0.5)
				button.set_disabled(true)
			button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_forest) + " Punkte")
		if button.name == "UpDownButton":
			if GamePlayData.locked_street: 
				button.modulate = Color(1, 1, 1, 0.5)
				button.set_disabled(true)
			button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_street) + " Punkte")
		if button.name == "LaneButton":
			if GamePlayData.locked_city: 
				button.modulate = Color(1, 1, 1, 0.5)
				button.set_disabled(true)
			button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_city) + " Punkte")






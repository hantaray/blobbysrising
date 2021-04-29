extends Control

var scene_path_to_load

func _ready():
	update_buttons()
#	$Menu/CenterRow/JumpButton.grab_focus()
	for button in $VBoxContainer/CenterRow.get_children():
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
	for button in $VBoxContainer/CenterRow.get_children():
		if button.name == "JumpButton":
			if GamePlayData.locked_forest: 
				button.modulate = Color(1, 1, 1, 0.5)
				button.set_disabled(true)
				
			if GamePlayData.highscore_forest < GamePlayData.score_goal_forest:
				button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_forest) + " / " + str(GamePlayData.score_goal_forest) + " Punkte")
			else:
				button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_forest) + " Punkte")
			updateMedals(button, GamePlayData.highscore_forest)
		if button.name == "StreetLevel":
			if GamePlayData.locked_street: 
				button.modulate = Color(1, 1, 1, 0.5)
				button.set_disabled(true)
				
			if GamePlayData.highscore_street < GamePlayData.score_goal_street:
				button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_street) + " / " + str(GamePlayData.score_goal_street) + " Punkte")
			else:
				button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_street) + " Punkte")
			updateMedals(button, GamePlayData.highscore_street)
		if button.name == "LaneButton":
			if GamePlayData.locked_city: 
				button.modulate = Color(1, 1, 1, 0.5)
				button.set_disabled(true)
				
			if GamePlayData.highscore_city < GamePlayData.score_goal_city:
				button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_city) + " / " + str(GamePlayData.score_goal_city) + " Punkte")
			else:
				button.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_city) + " Punkte")
			updateMedals(button, GamePlayData.highscore_city)
			
func updateMedals(button, score):
	if score >= GamePlayData.medal_goal_1:
		button.get_node("Medal").set_visible(true)
		button.get_node("Medal").texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Gold_1.png")
	if score >= GamePlayData.medal_goal_2:
		button.get_node("Medal").texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Gold_2.png")
	if score >= GamePlayData.medal_goal_3:
		button.get_node("Medal").texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Gold_3.png")
	if score >= GamePlayData.medal_goal_4:
		button.get_node("Medal").texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Rubin_1.png")
	if score >= GamePlayData.medal_goal_5:
		button.get_node("Medal").texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Rubin_2.png")
	if score >= GamePlayData.medal_goal_6:
		button.get_node("Medal").texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Rubin_3.png")
	





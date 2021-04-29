extends Control

var scene_path_to_load

func _ready():
	MainScript.current_level = 1
	update_buttons()
#	$Menu/CenterRow/JumpButton.grab_focus()
#	for button in $CenterRow.get_children():
#		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	var btn = $CenterContainer.get_node("JumpButton")
	btn.connect("pressed", self, "_on_Button_pressed", [btn.scene_to_load])
	var btn2 = $CenterContainer2.get_node("LaneButton")
	btn2.connect("pressed", self, "_on_Button_pressed", [btn2.scene_to_load])
	var btn3 = $CenterContainer3.get_node("StreetLevel")
	btn3.connect("pressed", self, "_on_Button_pressed", [btn3.scene_to_load])




func _on_Button_pressed(scene_to_load):
	print("press")
	$FadeIn.show()
	$FadeIn.fade_in()
	scene_path_to_load = scene_to_load
	MainScript.current_scene_path = scene_to_load


func _on_FadeIn_fade_finished():
	$FadeIn.hide()
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_path_to_load)
	
func update_buttons():
	var jumpBtn =  $CenterContainer/JumpButton
	if GamePlayData.locked_forest: 
		jumpBtn.modulate = Color(1, 1, 1, 0.5)
		jumpBtn.set_disabled(true)
		
	if GamePlayData.highscore_forest < GamePlayData.score_goal_forest:
		jumpBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_forest) + " / " + str(GamePlayData.score_goal_forest) + " Punkte")
	else:
		jumpBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_forest) + " Punkte")
	updateMedals(jumpBtn, GamePlayData.highscore_forest)
	
	var streetBtn =  $CenterContainer3/StreetLevel
	if GamePlayData.locked_street: 
		streetBtn.modulate = Color(1, 1, 1, 0.75)
		streetBtn.set_disabled(true)
		
	if GamePlayData.highscore_street < GamePlayData.score_goal_street:
		streetBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_street) + " / " + str(GamePlayData.score_goal_street) + " Punkte")
	else:
		streetBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_street) + " Punkte")
	updateMedals(streetBtn, GamePlayData.highscore_street)
	
	var cityBtn =  $CenterContainer2/LaneButton
	if GamePlayData.locked_city: 
		cityBtn.modulate = Color(1, 1, 1, 0.75)
		cityBtn.set_disabled(true)
		
	if GamePlayData.highscore_city < GamePlayData.score_goal_city:
		cityBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_city) + " / " + str(GamePlayData.score_goal_city) + " Punkte")
	else:
		cityBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_city) + " Punkte")
	updateMedals(cityBtn, GamePlayData.highscore_city)

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
	

func showNextLevel():
	if MainScript.current_level == 1:
		$CenterContainer.visible = false
		$CenterContainer2.visible = true
		$CenterContainer3.visible = false
		MainScript.current_level = 2
		$PrevLevelButton.visible = true
	elif MainScript.current_level == 2:
		$CenterContainer.visible = false
		$CenterContainer2.visible = false
		$CenterContainer3.visible = true
		MainScript.current_level = 3
		$NextLevelButton.visible = false
		$PrevLevelButton.visible = true
	elif MainScript.current_level == 3:
		$CenterContainer.visible = false
		$CenterContainer2.visible = false
		$CenterContainer3.visible = true
		$PrevLevelButton.visible = true
		
func showPrevLevel():
	if MainScript.current_level == 1:
		$CenterContainer.visible = true
		$CenterContainer2.visible = false
		$CenterContainer3.visible = false
		$NextLevelButton.visible = true
	elif MainScript.current_level == 2:
		$CenterContainer.visible = true
		$CenterContainer2.visible = false
		$CenterContainer3.visible = false
		$PrevLevelButton.visible = false
		$NextLevelButton.visible = true
		MainScript.current_level = 1
	elif MainScript.current_level == 3:
		$CenterContainer.visible = false
		$CenterContainer2.visible = true
		$CenterContainer3.visible = false
		MainScript.current_level = 2
		$NextLevelButton.visible = true




func _on_NextLevelButton_pressed():
	showNextLevel()


func _on_PrevLevelButton_pressed():
	showPrevLevel()

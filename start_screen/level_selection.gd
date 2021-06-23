extends Control

var scene_path_to_load

func _ready():
	get_node("Music").play()
	MainScript.current_level = 1
	update_buttons()
#	$Menu/CenterRow/JumpButton.grab_focus()
#	for button in $CenterRow.get_children():
#		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	var btn = $Camera/CenterContainer.get_node("SubwayButton")
	btn.connect("pressed", self, "_on_Button_pressed", [btn.scene_to_load])
	var btn2 = $Camera/CenterContainer2.get_node("CityButton")
	btn2.connect("pressed", self, "_on_Button_pressed", [btn2.scene_to_load])
	var btn3 = $Camera/CenterContainer3.get_node("StreetLevel")
	btn3.connect("pressed", self, "_on_Button_pressed", [btn3.scene_to_load])
	var btn4 = $Camera/CenterContainer4.get_node("RedisLevel")
	btn4.connect("pressed", self, "_on_Button_pressed", [btn4.scene_to_load])
	var btn5 = $Camera/CenterContainer5.get_node("PeaceLevel")
	btn5.connect("pressed", self, "_on_Button_pressed", [btn5.scene_to_load])
	var btn6 = $Camera/CenterContainer6.get_node("CaringButton")
	btn6.connect("pressed", self, "_on_Button_pressed", [btn6.scene_to_load])
	MainScript.save_game()




func _on_Button_pressed(scene_to_load):
	$Camera/CenterContainer5/PeaceLevel/Sound.play()
	MainScript.reset_level_data()
	$Camera/FadeIn.show()
	$Camera/FadeIn.fade_in()
	scene_path_to_load = scene_to_load
	MainScript.current_scene_path = scene_to_load

func _on_FadeIn_fade_finished():
	$Camera/FadeIn.hide()
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_path_to_load)
	
func update_buttons():
	var jumpBtn =  $Camera/CenterContainer/SubwayButton
	if GamePlayData.locked_forest: 
		jumpBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Bahn_start_grayscale.png")
		jumpBtn.get_node("Lock").show()
		jumpBtn.set_disabled(true)
	else:
		jumpBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Bahn_start.png")
		jumpBtn.get_node("Lock").hide()
		jumpBtn.set_disabled(false)
		
	if GamePlayData.highscore_forest < GamePlayData.score_goal_forest:
		jumpBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_forest) + " / " + str(GamePlayData.score_goal_forest) + " Punkte")
	else:
		jumpBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_forest) + " Punkte")
	updateMedals(jumpBtn, GamePlayData.highscore_forest)
	
	var streetBtn =  $Camera/CenterContainer3/StreetLevel
	if GamePlayData.locked_street: 
		streetBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Fahrrad_start_grayscale.png")
		streetBtn.get_node("Lock").show()
		streetBtn.set_disabled(true)
	else:
		streetBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Fahrrad_start.png")
		streetBtn.get_node("Lock").hide()
		streetBtn.set_disabled(false)
		
	if GamePlayData.highscore_street < GamePlayData.score_goal_street:
		streetBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_street) + " / " + str(GamePlayData.score_goal_street) + " Punkte")
	else:
		streetBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_street) + " Punkte")
	updateMedals(streetBtn, GamePlayData.highscore_street)
	
	var cityBtn =  $Camera/CenterContainer2/CityButton
	if GamePlayData.locked_city: 
		cityBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Miete_start_grayscale.png")
		cityBtn.get_node("Lock").show()
		cityBtn.set_disabled(true)
	else:
		cityBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Miete_start.png")
		cityBtn.get_node("Lock").hide()
		cityBtn.set_disabled(false)
		
	if GamePlayData.highscore_city < GamePlayData.score_goal_city:
		cityBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_city) + " / " + str(GamePlayData.score_goal_city) + " Punkte")
	else:
		cityBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_city) + " Punkte")
	updateMedals(cityBtn, GamePlayData.highscore_city)
	
	var redisBtn =  $Camera/CenterContainer4/RedisLevel
	if GamePlayData.locked_redis: 
		redisBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Umverteilung_start_grayscale.png")
		redisBtn.get_node("Lock").show()
		redisBtn.set_disabled(true)
	else:
		redisBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Umverteilung_start.png")
		redisBtn.get_node("Lock").hide()
		redisBtn.set_disabled(false)
		
	if GamePlayData.highscore_redis < GamePlayData.score_goal_redis:
		redisBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_redis) + " / " + str(GamePlayData.score_goal_redis) + " Punkte")
	else:
		redisBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_redis) + " Punkte")
	updateMedals(redisBtn, GamePlayData.highscore_redis)
	
	var peaceBtn =  $Camera/CenterContainer5/PeaceLevel
	if GamePlayData.locked_peace: 
		peaceBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Peace_start_grayscale.png")
		peaceBtn.get_node("Lock").show()
		peaceBtn.set_disabled(true)
	else:
		peaceBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Peace_start.png")
		peaceBtn.get_node("Lock").hide()
		peaceBtn.set_disabled(false)
		
	if GamePlayData.highscore_peace < GamePlayData.score_goal_peace:
		peaceBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_peace) + " / " + str(GamePlayData.score_goal_peace) + " Punkte")
	else:
		peaceBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_peace) + " Punkte")
	updateMedals(peaceBtn, GamePlayData.highscore_peace)
	
	var caringBtn =  $Camera/CenterContainer6/CaringButton
	if GamePlayData.locked_caring: 
		caringBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Pflege_start_grayscale.png")
		caringBtn.get_node("Lock").show()
		caringBtn.set_disabled(true)
	else:
		caringBtn.icon = \
			load("res://Sprites/JumpForLeft_Grafiken/Hintergruende/LevelStart/Pflege_start.png")
		caringBtn.get_node("Lock").hide()
		caringBtn.set_disabled(false)
		
	if GamePlayData.highscore_caring < GamePlayData.score_goal_caring:
		caringBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_caring) + " / " + str(GamePlayData.score_goal_caring) + " Punkte")
	else:
		caringBtn.get_node("HighScoreLabel").set_text(str(GamePlayData.highscore_caring) + " Punkte")
	updateMedals(caringBtn, GamePlayData.highscore_caring)

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
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(true)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(false)
		MainScript.current_level = 2
		$Camera/PrevLevelButton.set_visible(true)
	elif MainScript.current_level == 2:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(true)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(false)
		MainScript.current_level = 3
	elif MainScript.current_level == 3:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(true)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(false)
		$Camera/PrevLevelButton.set_visible(true)
		MainScript.current_level = 4
		$Camera/PrevLevelButton.set_visible(true)
	elif MainScript.current_level == 4:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(true)
		$Camera/CenterContainer6.set_visible(false)
		$Camera/PrevLevelButton.set_visible(true)
		MainScript.current_level = 5
		$Camera/PrevLevelButton.set_visible(true)
	elif MainScript.current_level == 5:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(true)
		$Camera/PrevLevelButton.set_visible(true)
		MainScript.current_level = 6
		$Camera/NextLevelButton.set_visible(false)
		$Camera/PrevLevelButton.set_visible(true)
	elif MainScript.current_level == 6:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(true)
		$Camera/PrevLevelButton.set_visible(true)
		
func showPrevLevel():
	if MainScript.current_level == 1:
		$Camera/CenterContainer.set_visible(true)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(false)
		$Camera/NextLevelButton.set_visible(true)
	elif MainScript.current_level == 2:
		$Camera/CenterContainer.set_visible(true)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(false)
		$Camera/PrevLevelButton.set_visible(false)
		$Camera/NextLevelButton.set_visible(true)
		MainScript.current_level = 1
	elif MainScript.current_level == 3:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(true)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(false)
		MainScript.current_level = 2
	elif MainScript.current_level == 4:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(true)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(false)
		MainScript.current_level = 3
	elif MainScript.current_level == 5:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(true)
		$Camera/CenterContainer5.set_visible(false)
		$Camera/CenterContainer6.set_visible(false)
		MainScript.current_level = 4
	elif MainScript.current_level == 6:
		$Camera/CenterContainer.set_visible(false)
		$Camera/CenterContainer2.set_visible(false)
		$Camera/CenterContainer3.set_visible(false)
		$Camera/CenterContainer4.set_visible(false)
		$Camera/CenterContainer5.set_visible(true)
		$Camera/CenterContainer6.set_visible(false)
		MainScript.current_level = 5
		$Camera/NextLevelButton.set_visible(true)




func _on_NextLevelButton_pressed():
	$Camera/NextLevelButton/Sound.play()
	showNextLevel()


func _on_PrevLevelButton_pressed():
	$Camera/PrevLevelButton/Sound.play()
	showPrevLevel()

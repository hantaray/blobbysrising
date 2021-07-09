extends CanvasLayer

onready var life_icon_list = $LiveLabel.get_children()

var life_icon = preload("res://Items/LifeIcon1.tscn")

func _ready():
	MainScript.update_lives_hud()
	if MainScript.levelRestart:
		get_tree().paused = false
		get_node("LevelInfo").hide()
	$HBoxContainer/VBoxContainer/HighScoreLabel.text = "Highscore: " + str(GamePlayData.highscore_peace)
func update_score(score):
	$HBoxContainer/VBoxContainer/HBoxContainer/ScoreLabel.text = 'Punkte: ' + str(score)

func update_lives_hud(lifes):
	delete_children($LiveLabel)
	for n in lifes:
		var icon_inst = life_icon.instance()
		$LiveLabel.add_child(icon_inst)

func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
	
func _on_TextureButton_button_down():
	$HBoxContainer/TextureButton/Sound.play()
	MainScript.pause_button_pressed = true


func _on_TextureButton_button_up():
	MainScript.pause_button_pressed = false
	showPauseScreen()
	
func update_perfcoll_label(perfcoll_multiplier):
	if perfcoll_multiplier > 1:
		$HBoxContainer/VBoxContainer/HBoxContainer/PerfectCollLabel.text = ' x ' + str(perfcoll_multiplier)
	else:
		$HBoxContainer/VBoxContainer/HBoxContainer/PerfectCollLabel.text = ''
	
func showGameOverScreen():
	$GameOverScreen/Music.stream = load("res://Audio/gameover_01.wav")
	$GameOverScreen/Music.play()
	get_tree().paused = true
	get_node("HBoxContainer").hide()
	$GameOverScreen/TextureRect/WinLabel.set_visible(false)
	$GameOverScreen/TextureRect/MenuLabel.text = "Game Over"
	$GameOverScreen/TextureRect/MenuLabel.set_visible(true)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.set_visible(true)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.text = str($HBoxContainer/VBoxContainer/HBoxContainer/ScoreLabel.text)
	updateMedal(int($HBoxContainer/VBoxContainer/HBoxContainer/ScoreLabel.text))
	$GameOverScreen/TextureRect/CenterContainer/HBoxContainer/ResumeButton.hide()
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	MainScript.save_game()
	$GameOverScreen.show()
	
func showPauseScreen():
	get_tree().paused = true
	updateLevelInfo(true)
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	$GameOverScreen/TextureRect/MenuLabel.show()
#	$GameOverScreen.show()
	$LevelInfo.show()
	
func showWinScreen():
	$GameOverScreen/Music.stream = load("res://Audio/levelcomplete_01.wav")
	$GameOverScreen/Music.play()
	get_tree().paused = true
#	get_node("HBoxContainer").hide()
	print(MainScript.current_scene)
	if MainScript.current_scene == "Street":
		$GameOverScreen/TextureRect/WinLabel.text = "Gratulation!\n\nDu hast alle Levelziele erreicht!\n\nVersuche die Highscores zu knacken\num weitere Medaillen frei zu schalten."
	else:
		$GameOverScreen/TextureRect/WinLabel.text = "Gratulation!\n\nDu hast das Levelziel erreicht!\nDas nächste Level wurde frei geschaltet.\n\nSpiele dieses Level weiter, um den Highscore zu knacken\nund weitere Medaillen frei zu schalten\noder gehe in das nächste Level."
	$GameOverScreen/TextureRect/WinLabel.set_visible(true)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.set_visible(false)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.text = str($HBoxContainer/VBoxContainer/HBoxContainer/ScoreLabel.text)
#	$GameOverScreen/TextureRect/CenterContainer/HBoxContainer/ResumeButton.hide()
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	MainScript.save_game()
	$GameOverScreen.show()
	
func showManualScreen():
	get_tree().paused = true
	$Manual.show()
	
func updateLevelInfo(pause):
	if pause:
		$LevelInfo/CenterContainer2/HBoxContainer/ReplayButton.set_visible(true)
		$LevelInfo/TextureRect/PauseLabel.set_visible(true)
	else:
		$LevelInfo/TextureRect/PauseLabel.set_visible(false)
		$LevelInfo/CenterContainer2/HBoxContainer/ReplayButton.set_visible(false)
	var currentLevel = MainScript.current_scene
	var current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Peace.tscn"
	var manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Peace.tscn"
	if currentLevel == "Subway":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_PublicTransport.tscn"
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Train.tscn"
	if currentLevel == "City":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_City.tscn"
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_City.tscn"
	if currentLevel == "Street":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Bike.tscn"
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Bike.tscn"
	if currentLevel == "Redis":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Umverteilung.tscn"
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Umverteilung.tscn"
	if currentLevel == "Peace":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Peace.tscn"
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Peace.tscn"
	if currentLevel == "Caring":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Care.tscn"
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Care.tscn"
	delete_children($LevelInfo/LevelTextContainer)
	$LevelInfo/LevelTextContainer.add_child(load(current_level_text_path).instance())
	delete_children($Manual/ManualScrollContainer/ManualCenterContainer)
	$Manual/ManualScrollContainer/ManualCenterContainer.add_child(load(manual_container_path).instance())




func updateMedal(score):
	if score >= GamePlayData.medal_goal_1:
		$GameOverScreen/TextureRect/Medal.set_visible(true)
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Gold_1.png")
	if score >= GamePlayData.medal_goal_2:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Gold_2.png")
	if score >= GamePlayData.medal_goal_3:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Gold_3.png")
	if score >= GamePlayData.medal_goal_4:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Rubin_1.png")
	if score >= GamePlayData.medal_goal_5:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Rubin_2.png")
	if score >= GamePlayData.medal_goal_6:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/Rubin_3.png")
	if score >= GamePlayData.medal_goal_7:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/B_1.png")
	if score >= GamePlayData.medal_goal_8:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/B_2.png")
	if score >= GamePlayData.medal_goal_9:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/B_3.png")
	if score >= GamePlayData.medal_goal_10:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/SR_1.png")
	if score >= GamePlayData.medal_goal_11:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/SR_2.png")
	if score >= GamePlayData.medal_goal_12:
		$GameOverScreen/TextureRect/Medal.texture = \
			load("res://Sprites/JumpForLeft_Grafiken/Items/Medals/SR_3.png")

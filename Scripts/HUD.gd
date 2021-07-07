extends CanvasLayer

onready var life_icon_list = $LiveLabel.get_children()

var life_icon = preload("res://Items/LifeIcon1.tscn")

func _ready():
	MainScript.update_lives_hud()
	if MainScript.levelRestart:
		get_tree().paused = false
		get_node("LevelInfo").hide()

func update_score(score):
	$HBoxContainer/ScoreLabel.text = 'Punkte: ' + str(score)

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
		$HBoxContainer/PerfectCollLabel.text = 'x ' + str(perfcoll_multiplier)
	else:
		$HBoxContainer/PerfectCollLabel.text = ''
	
func showGameOverScreen():
	$GameOverScreen/Music.stream = load("res://Audio/gameover_01.wav")
	$GameOverScreen/Music.play()
	get_tree().paused = true
	get_node("HBoxContainer").hide()
	$GameOverScreen/TextureRect/MenuLabel.text = "Game Over"
	$GameOverScreen/TextureRect/MenuLabel.set_visible(true)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.set_visible(true)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.text = str($HBoxContainer/ScoreLabel.text)
	updateMedal(int($HBoxContainer/ScoreLabel.text))
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
	$GameOverScreen/TextureRect/MenuLabel.text = "Gratulation!\n\nDu hast das Levelziel erreicht!\nDas nächste Level wurde frei geschaltet.\n\nSpiele dieses Level weiter, um den Highscore zu knacken\nund weitere Medallien frei zu schalten\noder gehe in das nächste Level."
	$GameOverScreen/TextureRect/MenuLabel.set_visible(true)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.set_visible(false)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.text = str($HBoxContainer/ScoreLabel.text)
#	$GameOverScreen/TextureRect/CenterContainer/HBoxContainer/ResumeButton.hide()
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	MainScript.save_game()
	$GameOverScreen.show()
	
func updateLevelInfo(pause):
	if pause:
		$LevelInfo/CenterContainer2/HBoxContainer/ReplayButton.set_visible(true)
		$LevelInfo/TextureRect/PauseLabel.set_visible(true)
	else:
		$LevelInfo/TextureRect/PauseLabel.set_visible(false)
		$LevelInfo/CenterContainer2/HBoxContainer/ReplayButton.set_visible(false)
	var currentLevel = MainScript.current_scene
	var current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Peace.tscn"
	if currentLevel == "Subway":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_PublicTransport.tscn"
	if currentLevel == "City":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_City.tscn"
	if currentLevel == "Street":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Bike.tscn"
	if currentLevel == "Redis":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Umverteilung.tscn"
	if currentLevel == "Peace":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Peace.tscn"
	if currentLevel == "Caring":
		current_level_text_path = "res://gameover_screen/LevelTexts/LevelText_Care.tscn"
	$LevelInfo/LevelTextContainer.add_child(load(current_level_text_path).instance())
	
#	var currentLevel = MainScript.current_scene
#	if currentLevel == "Subway":
#
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Station_Sign/Haltestelle_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Screw/Schraube_2_K.png")
#
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Ticket/Ticket_1_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/InterBlobExpress/Zug_K.png")
#
#	if currentLevel == "City":
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Deckel/Mietendeckel_1_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.set_visible(false)
#
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Mietenfalle/Mietenfalle_1_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Schloss/Privat_K.png")
#
#	if currentLevel == "Street":
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Fahrradschild/FS_ganz_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.set_visible(false)
#
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/truck/Blob_truck2_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/SpurBlocker/Spur_blocker_blinker_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer2/TextureRect3.set_visible(true)
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer2/TextureRect4.set_visible(true)
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer2/TextureRect5.set_visible(true)
#
#	if currentLevel == "Redis":
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Geld/Money_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Geld/more_money_K.png")
#
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/PanamaBKF/Panama_BKF_offen_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.set_visible(false)
#
#	if currentLevel == "Peace":
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Taube/Taube_2_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.set_visible(false)
#
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Uzi/Gun_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Panzer/Panzer_1_K.png")
#
#	if currentLevel == "Caring":
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Lohnbrief/Lohnbrief_auf_K.png")
#		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Patientenschluessel/Patientenschluessel.png")
#
#
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
#		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Coroni/coroni.png")
#		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.set_visible(false)



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

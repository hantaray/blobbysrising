extends CanvasLayer



onready var life_icon_list = $LiveLabel.get_children()

var life_icon = preload("res://Items/LifeIcon1.tscn")

func _ready():
	MainScript.update_lives_hud()

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
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.set_visible(true)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.text = str($HBoxContainer/ScoreLabel.text)
	updateMedal(int($HBoxContainer/ScoreLabel.text))
	$GameOverScreen/TextureRect/CenterContainer/HBoxContainer/ResumeButton.hide()
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	MainScript.save_game()
	$GameOverScreen.show()
	
func showPauseScreen():
	get_tree().paused = true
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	$GameOverScreen.show()
	
func showWinScreen():
	$GameOverScreen/Music.stream = load("res://Audio/levelcomplete_01.wav")
	$GameOverScreen/Music.play()
	get_tree().paused = true
	get_node("HBoxContainer").hide()
	$GameOverScreen/TextureRect/MenuLabel.text = "Level abgeschlossen"
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.set_visible(true)
	$GameOverScreen/TextureRect/ScoreContainer/ScoreLabel.text = str($HBoxContainer/ScoreLabel.text)
	$GameOverScreen/TextureRect/CenterContainer/HBoxContainer/ResumeButton.hide()
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	MainScript.save_game()
	$GameOverScreen.show()
	
func updateLevelInfo():
	var currentLevel = MainScript.current_scene
	if currentLevel == "Subway":
		
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Station_Sign/Haltestelle_Links.png")
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Screw/Schraube_unten.png")
		
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Ticket/Ticket_auf.png")
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Gegner/InterBlobExpress/Inter_blob_express.png")
		
	if currentLevel == "City":
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Deckel/Mietendeckel_oben.png")
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.set_visible(false)
		
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Deckel/Mietenfalle_auf.png")
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Schloss/Privatisierung.png")
		
	if currentLevel == "Street":
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Fahrradschild/FS_ganz.png")
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.set_visible(false)
		
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Schlagloch/Schlagloch.png")
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Gegner/SpurBlocker/Spur_blocker_blinker.png")
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect3.set_visible(true)
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer2/TextureRect4.set_visible(true)
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer2/TextureRect5.set_visible(true)

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





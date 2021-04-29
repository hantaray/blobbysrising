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
	get_tree().paused = true
	get_node("HBoxContainer").hide()
	$GameOverScreen/TextureRect/MenuLabel.text = "Game Over"
	$GameOverScreen/TextureRect/ScoreLabel.visible = true
	$GameOverScreen/TextureRect/ScoreLabel.text = str($HBoxContainer/ScoreLabel.text)
	$GameOverScreen/TextureRect/CenterContainer/HBoxContainer/ResumeButton.hide()
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	$GameOverScreen.show()
	
func showPauseScreen():
	get_tree().paused = true
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	$GameOverScreen.show()
	
func showWinScreen():
	get_tree().paused = true
	get_node("HBoxContainer").hide()
	$GameOverScreen/TextureRect/MenuLabel.text = "Level abgeschlossen"
	$GameOverScreen/TextureRect/ScoreLabel.visible = false
	$GameOverScreen/TextureRect/CenterContainer/HBoxContainer/ResumeButton.hide()
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	$GameOverScreen.show()
	
func updateLevelInfo():
	var currentLevel = MainScript.current_scene
	print(currentLevel)
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
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.visible = false
		
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Deckel/Mietenfalle_auf.png")
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Schloss/Privatisierung.png")
		
	if currentLevel == "Street":
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Freunde/Fahrradschild/FS_ganz.png")
		$LevelInfo/CenterContainer/VBoxContainer/CollectContainer/TextureRect2.visible = false
		
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Gegner/Schlagloch/Schlagloch.png")
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect2.texture = \
		load("res://Sprites/JumpForLeft_Grafiken/Gegner/SpurBlocker/Spur_blocker_blinker.png")
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer/TextureRect3.visible = true
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer2/TextureRect4.visible = true
		$LevelInfo/CenterContainer/VBoxContainer/DodgeContainer/VBoxContainer/HBoxContainer2/TextureRect5.visible = true
	







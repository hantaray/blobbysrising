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

func _on_TextureButton_pressed():
	showPauseScreen()
	
func update_perfcoll_label(perfcoll_multiplier):
	$HBoxContainer/PerfectCollLabel.text = 'x' + str(perfcoll_multiplier)
	
func showGameOverScreen():
	get_tree().paused = true
	get_node("HBoxContainer").hide()
	$GameOverScreen/TextureRect/MenuLabel.text = "Game Over"
	$GameOverScreen/TextureRect/ScoreLabel.visible = true
	$GameOverScreen/TextureRect/ScoreLabel.text = "Punkte: " \
	+ str($HBoxContainer/ScoreLabel.text)
	$GameOverScreen/TextureRect/CenterContainer/HBoxContainer/ResumeButton.hide()
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	$GameOverScreen.show()
	
func showPauseScreen():
	get_tree().paused = true
	$GameOverScreen/TextureRect.self_modulate = Color(1, 1, 1, 0.75)
	$GameOverScreen.show()

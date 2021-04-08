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
# warning-ignore:return_value_discarded
	get_tree().change_scene(MainScript.startscreen_path)
	
	
func update_perfcoll_label(perfcoll_multiplier):
	$HBoxContainer/PerfectCollLabel.text = 'x' + str(perfcoll_multiplier)

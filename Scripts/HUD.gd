extends CanvasLayer

var lifes = 5
onready var life_icon_list = $LiveLabel.get_children()

var life_icon = preload("res://Items/LifeIcon1.tscn")

func _ready():
	update_lives_hud()


func decrease_lives(life):
	lifes -= life
	update_lives_hud()
	if lifes <= 0:
		game_over()

func update_score(score):
	$ScoreLabel.text = 'Punkte: ' + str(score)


func update_lives_hud():
	delete_children($LiveLabel)
	for n in lifes:
		var icon_inst = life_icon.instance()
		$LiveLabel.add_child(icon_inst)


func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()



func game_over():
	print("game over")
	get_tree().change_scene("res://Scenes/JumpMovement.tscn")
	pass

extends Control

func _ready():
	var currentLevel = MainScript.current_scene
	var manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Peace.tscn"
	if currentLevel == "Subway":
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Train.tscn"
	if currentLevel == "City":
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_City.tscn"
	if currentLevel == "Street":
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Bike.tscn"
	if currentLevel == "Redis":
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Umverteilung.tscn"
	if currentLevel == "Peace":
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Peace.tscn"
	if currentLevel == "Caring":
		manual_container_path = "res://gameover_screen/ManualScreens/ManualContainer/ManualContainer_Care.tscn"
	$ManualScrollContainer/ManualCenterContainer.add_child(load(manual_container_path).instance())


func _on_BackButton_pressed():
	hide()
#	get_tree().change_scene(MainScript.current_scene_path)


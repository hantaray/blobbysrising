extends Button




func _on_InfoButton_pressed():
	$Sound.play()


func _on_Sound_finished():
	get_tree().change_scene("res://start_screen/InfoScreen.tscn")

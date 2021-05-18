extends Area2dFriend


var geld = preload("res://characters/friends/friend_geld.tscn")



func _on_Timer_timeout():
	if $VisibilityNotifier2D.is_on_screen():
		var geld_inst = geld.instance()
		var parent = get_parent()
		if parent != null:
			parent.add_child(geld_inst)
			var geld_pos = position
			geld_pos.x += 100
			geld_inst.position = geld_pos

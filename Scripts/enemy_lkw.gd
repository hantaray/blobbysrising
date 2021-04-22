extends Area2dEnemy

var wolke = preload("res://characters/enemies/enemy_wolke.tscn")

# warning-ignore:unused_argument
func _physics_process(delta):
	velocity = Vector2(GamePlayData.enemyLkwSpeed, speed_y)

func _on_Timer_timeout():
	if $VisibilityNotifier2D.is_on_screen():
		var wolke_inst = wolke.instance()
		var parent = get_parent()
		if parent != null:
			parent.add_child(wolke_inst)
			var wolke_pos = position
			wolke_pos.x -= 100
			wolke_inst.position = wolke_pos


	


func _on_enemy_lkw_body_entered(body):
	friend_collides(body)

extends AnimatedSprite




func _on_Player_UpDown_animate(showEnemyHitAnimation, showFriendHitAnimation):
	if showEnemyHitAnimation:
		stop()
		play("hitEnemy")
	elif showFriendHitAnimation:
		stop()
		play("hitFriend")
	else:
		play("idle")

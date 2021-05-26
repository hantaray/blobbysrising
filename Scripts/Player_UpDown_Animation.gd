extends AnimatedSprite




func _on_Player_UpDown_animate(showEnemyHitAnimation, showFriendHitAnimation):
	if showEnemyHitAnimation:
		play("hitEnemy")
	elif showFriendHitAnimation:
		play("hitFriend")
	else:
		play("idle")

extends AnimatedSprite

#func _ready():
#	play('idle')



func _on_Player_Lane_animate(showEnemyHitAnimation, showFriendHitAnimation):
	if showEnemyHitAnimation:
		play("hitEnemy")
	elif showFriendHitAnimation:
		play("hitFriend")
	else:
		play("idle")

extends AnimatedSprite

const JUMP_ANI_BORDER = -200
const FALL_ANI_BORDER = 350




func _on_Player_JustJump_animate(motion, isOnFloor):
	if isOnFloor:
		play("idle")
	elif motion.y < JUMP_ANI_BORDER:
		play("jump")
	elif motion.y > FALL_ANI_BORDER:
		play("fall")
	else:
		play("idle")

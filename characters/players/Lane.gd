extends KinematicBody2D

onready var screen_width = get_tree().get_root().get_viewport().size.x
onready var screen_height = get_tree().get_root().get_viewport().size.y

var shape_height = 0

var motion = Vector2(0,0)
var SPEED = 600
const GRAVITY = 50
const UP = Vector2(0,-1)


var pauseBtnArea

var showEnemyHitAnimation = false
const enemyHitAnimationTime = GamePlayData.INVULNERABLE_TIME
var showFriendHitAnimation = false
const friendHitAnimationTime = GamePlayData.FRIEND_HIT_ANIMATION_TIME

signal animate

var screenIsTouched = false

var item_collected = false
 
func _ready():
	var pauseBtn = get_tree().get_root().get_node("LaneMovement/HUD/HBoxContainer/TextureButton")
	pauseBtnArea = Rect2(0,0, pauseBtn.get_normal_texture().get_height(), pauseBtn.get_normal_texture().get_width())
	shape_height = $CollisionShape2D.shape.height
	add_to_group('Player')


# warning-ignore:unused_argument
func _physics_process(delta):
	SPEED = GamePlayData.playerSpeed
	move_forward()
# warning-ignore:return_value_discarded
	animate()
	move_and_slide(motion, UP)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screenIsTouched = true
			var TouchPoint = event.get_position()
			# UpMovement
			# TopScreenBorder
			if position.y > 400 \
			and TouchPoint.y < position.y - shape_height*2 \
			and !(pauseBtnArea.has_point(TouchPoint)):
				$MoveSound.play()
				position.y -= 210
			# DownMovement
			# ButtomScreenBorder
			elif position.y < 850 \
			and TouchPoint.y > position.y + shape_height*2 \
			and !(pauseBtnArea.has_point(TouchPoint)):
				$MoveSound.play()
				position.y += 210
		else:
			screenIsTouched = false

func move_forward():
	motion.x = SPEED

func increase_move_speed():
	GamePlayData.playerSpeed += GamePlayData.speed_increase_lane
#	SPEED += GamePlayData.speed_increase_lane

func animate():
	emit_signal("animate", showEnemyHitAnimation, showFriendHitAnimation)

func play_enemy_hit_animation():
	showEnemyHitAnimation = true
	yield(get_tree().create_timer(enemyHitAnimationTime), "timeout")
	showEnemyHitAnimation = false

func play_friend_hit_animation():
	showFriendHitAnimation = true
	yield(get_tree().create_timer(friendHitAnimationTime), "timeout")
	showFriendHitAnimation = false

func play_friend_hit_sound():
	var sound = get_node("Sound")
	sound.stream = load("res://Audio/collect.mp3")
	sound.play()
	
func play_enemy_hit_sound():
	var sound = get_node("Sound")
	sound.stream = load("res://Audio/hit.mp3")
	sound.play()
	
func collect_item(item):
	if item.is_in_group("lohnbrief"):
		$Lohnbrief.set_visible(true)
		$PSchluessel.set_visible(false)
		item_collected = true
	elif item.is_in_group("patientenschluessel"):
		$PSchluessel.set_visible(true)
		$Lohnbrief.set_visible(false)
		item_collected = true
		
func give_item():
	if item_collected:
		item_collected = false
		$PSchluessel.set_visible(false)
		$Lohnbrief.set_visible(false)
	







# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

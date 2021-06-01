extends Camera2D

var width = 0

func _ready():
#	width = $TextureRect.texture.get_width()
	pass
#
#func _process(delta):
#	var curPos =  position
#	curPos.x = curPos.x - 100 * delta
#	position =  curPos
#
#	print(position.x)
#	if position.x <= -width/4:
#		position.x = 0
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	set_process(true)

func _process(delta):
	var curPos =  position
	curPos.x = curPos.x + 100 * delta
	position =  curPos

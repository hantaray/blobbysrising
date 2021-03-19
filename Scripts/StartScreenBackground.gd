extends ParallaxBackground

var scroll = Vector2(-500,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset += scroll * delta

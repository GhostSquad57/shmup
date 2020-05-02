extends ParallaxBackground

export (int) var scroll_speed = 200

onready var image_width = $ParallaxLayer/Sprite.texture.get_width()

func _process(delta):    
	# Scroll background
	scroll_offset.x -= scroll_speed * delta
	if scroll_offset.x <= -image_width:
		var remainder = scroll_offset.x + image_width
		scroll_offset.x = 0 + remainder

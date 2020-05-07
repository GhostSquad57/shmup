extends Area2D


export (int) var speed = 200

func _process(delta):
	move_local_y(speed * delta)
	
	if !$VisibilityNotifier2D.is_on_screen():
		queue_free()

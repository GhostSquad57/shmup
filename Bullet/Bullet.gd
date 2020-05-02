extends Area2D


export (int) var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta
	
	if !$VisibilityNotifier2D.is_on_screen():
		queue_free()

extends Sprite

export (int) var speed = 100
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	position = position + velocity * speed * delta

	if position.y < 0:
		position.y = 0
	elif position.y > get_viewport().get_visible_rect().size.y:
		position.y = get_viewport().get_visible_rect().size.y

	if position.x < 0:
		position.x = 0
	elif position.x > get_viewport().get_visible_rect().size.x:
		position.x = get_viewport().get_visible_rect().size.x

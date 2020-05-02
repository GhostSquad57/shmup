extends Area2D

export (int) var speed = 100
var velocity = Vector2.ZERO
var bullet = preload("res://Bullet/Bullet.tscn")
var fire_timer = 0.2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	if Input.is_action_pressed("fire") and fire_timer < 0:
		fire()
		fire_timer = 0.2
	
	position = position + velocity * speed * delta
	
	check_border_collision()
	
	fire_timer -= delta
	

func check_border_collision():
	var extents = $CollisionShape2D.shape.extents /2
	var screen_size = get_viewport().get_visible_rect().size
	
	if position.y < 0 + extents.y:
		position.y = 0 + extents.y
	elif position.y > screen_size.y - extents.y:
		position.y = screen_size.y - extents.y
		
	if position.x < 0 + extents.x:
		position.x = 0 + extents.x
	elif position.x > screen_size.x - extents.x:
		position.x = screen_size.x - extents.x
		
func fire():
	var new_bullet = bullet.instance()
	new_bullet.global_transform = $Weapon1.global_transform
	var root = get_tree().root
	root.add_child(new_bullet)
	
	new_bullet = bullet.instance()
	new_bullet.global_transform = $Weapon2.global_transform
	root.add_child(new_bullet)

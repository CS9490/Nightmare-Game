extends Area2D

@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

# first for the sake of the animations being right
# I will just make the character move all over the screen 
# for the time being

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.set_frame(3)
		
	if velocity.x != 0:
		if velocity.x > 0:
			$AnimatedSprite2D.animation = "right"
		else:
			$AnimatedSprite2D.animation = "left"
	
	if velocity.y != 0:
		if velocity.y > 0:
			$AnimatedSprite2D.animation = "down"
		else:
			$AnimatedSprite2D.animation = "up"
		
		
	
		
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

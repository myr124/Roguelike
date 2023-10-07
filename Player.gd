extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.

	if Input.is_action_pressed("right"):
		velocity.x += 1
		print(velocity.x)
		print(velocity.y)
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	

	if velocity.x > 0:
		$AnimatedSprite2D.animation = "WalkRight"
	elif velocity.x<0:
		$AnimatedSprite2D.animation = "WalkLeft"
	

	if velocity.y > 0:
		$AnimatedSprite2D.animation = "WalkFor"
	elif velocity.y<0:
		$AnimatedSprite2D.animation = "WalkBack"


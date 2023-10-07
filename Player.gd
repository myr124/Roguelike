extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var dodgefac = 1.04
@export var health=100;
@export var stamina=100;
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):	
	$HealthBar.value = health
	$StaminaBar.value = stamina
	var velocity = Vector2.ZERO # The player's movement vector.
	speed = 400
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("sprint"):
		speed *= 1.5

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if Input.is_action_pressed("dodge"):
		position += velocity * delta * dodgefac
		stamina-=2
	position += velocity * delta

	position = position.clamp(Vector2.ZERO, screen_size)
	

	if velocity.x > 0:
		$AnimatedSprite2D.animation = "WalkRight"
		if velocity.y > 0:
			$AnimatedSprite2D.animation = "WalkRight"
	elif velocity.y<0:
		$AnimatedSprite2D.animation = "WalkBack"
	elif velocity.x<0:
		$AnimatedSprite2D.animation = "WalkLeft"
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "WalkFor"
	elif velocity.y<0:
		$AnimatedSprite2D.animation = "WalkBack"


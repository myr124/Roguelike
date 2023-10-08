extends Node2D

@export var speed = 50 # How fast the player will move (pixels/sec).

@export var health=100;

@onready var Player = $Player
var screen_size # Size of the game window.
var scene = preload("res://projectile.tscn")
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	$Player/HealthBar.value = health
#	var velocity = Vector2.ZERO # The player's movement vector.
	speed = 400
	Player.velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		Player.velocity.x += 1
	if Input.is_action_pressed("left"):
		Player.velocity.x -= 1
	if Input.is_action_pressed("down"):
		Player.velocity.y += 1
	if Input.is_action_pressed("up"):
		Player.velocity.y -= 1
	if Input.is_action_pressed("sprint"):
		speed *= 1.5
	if Input.is_action_just_pressed("attack") and $Player/Timer.is_stopped():
		proj()
	if Player.velocity.length() > 0:
		Player.velocity = Player.velocity.normalized() * speed
		$Player/AnimatedSprite2D.play()
	else:
		$Player/AnimatedSprite2D.stop()
	

#		position += velocity * delta * dodgefac
	Player.move_and_slide()
#	position += velocity * 
#	move_and_slide


	if Player.velocity.x > 0:
		$Player/AnimatedSprite2D.animation = "WalkRight"
		if Player.velocity.y > 0:
			$Player/AnimatedSprite2D.animation = "WalkRight"
	elif Player.velocity.y<0:
		$Player/AnimatedSprite2D.animation = "WalkBack"
	elif Player.velocity.x<0:
		$Player/AnimatedSprite2D.animation = "WalkLeft"
	if Player.velocity.y > 0:
		$Player/AnimatedSprite2D.animation = "WalkFor"
	elif Player.velocity.y<0:
		$Player/AnimatedSprite2D.animation = "WalkBack"

func proj():
	var inst = scene.instantiate()
	Player.add_child(inst)
#	inst.global_position = self.global_position
	var proj_rot = inst.global_position.direction_to(get_global_mouse_position()).angle()
	inst.rotation = proj_rot





	

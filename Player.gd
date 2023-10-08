extends Node2D

class_name PlayerClass

@export var speed = 250 # How fast the player will move (pixels/sec).

@export var health=100;

@onready var Player = $Player
var screen_size # Size of the game window.
var scene = preload("res://projectile.tscn")
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	$Player/HealthBar.value = health
#	var velocity = Vector2.ZERO # The player's movement vector.

	Player.velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		Player.velocity.x += 1
	if Input.is_action_pressed("left"):
		Player.velocity.x -= 1
	if Input.is_action_pressed("down"):
		Player.velocity.y += 1
	if Input.is_action_pressed("up"):
		Player.velocity.y -= 1
	
	if Player.velocity.length() > 0:
		Player.velocity = Player.velocity.normalized() * speed
		$Player/AnimatedSprite2D.play()
	else:
		$Player/AnimatedSprite2D.stop()
	
	if Input.is_action_just_pressed("range") and $Player/Timer.is_stopped():
		proj()
	if Input.is_action_pressed("melee") and $Player/Timer.is_stopped():
		$Player/AnimatedSprite2D.animation = "MeleeFor"
		playMeleeAnim("Melee")
	else:
		play_directional_animation("Walk")
#		position += velocity * delta * dodgefac
	Player.move_and_slide()
#	position += velocity * 
#	move_and_slide


#	if Player.velocity.x > 0:
#		if Player.velocity.y > 0:
#			$Player/AnimatedSprite2D.animation = "WalkForRight"
#		else:
#			$Player/AnimatedSprite2D.animation = "WalkRight"
#	elif Player.velocity.x<0:
#		$Player/AnimatedSprite2D.animation = "WalkLeft"
#	if Player.velocity.y > 0:
#		$Player/AnimatedSprite2D.animation = "WalkFor"
#	elif Player.velocity.y<0:
#		$Player/AnimatedSprite2D.animation = "WalkBack"
	
		
		

func proj():
	var inst = scene.instantiate()
	Player.add_child(inst)
#	inst.global_position = self.global_position
	var proj_rot = inst.global_position.direction_to(get_global_mouse_position()).angle()
	inst.rotation = proj_rot


func play_directional_animation(anim_name):
		if Player.velocity.x > 0:
			if Player.velocity.y > 0:
				$Player/AnimatedSprite2D.animation = anim_name+"ForRight"
			elif Player.velocity.y < 0:
				$Player/AnimatedSprite2D.animation = anim_name+"BackRight"
			else:
				$Player/AnimatedSprite2D.animation = anim_name+"Right"
		elif Player.velocity.x < 0:
			if Player.velocity.y > 0:
				$Player/AnimatedSprite2D.animation = anim_name+"ForLeft"
			elif Player.velocity.y < 0:
				$Player/AnimatedSprite2D.animation = anim_name+"BackLeft"
			else:
				$Player/AnimatedSprite2D.animation = anim_name+"Left"
		else:
			if Player.velocity.y > 0:
				$Player/AnimatedSprite2D.animation = anim_name+"For"
			elif Player.velocity.y < 0:
				$Player/AnimatedSprite2D.animation = anim_name+"Back"
			else:
				$Player/AnimatedSprite2D.animation = "Idle"
func playMeleeAnim(anim_name):
	if Input.is_action_just_released("melee"):
		if Player.velocity.x > 0:
			if Player.velocity.y > 0:
				$Player/AnimatedSprite2D.animation = anim_name+"ForRight"
			elif Player.velocity.y < 0:
				$Player/AnimatedSprite2D.animation = anim_name+"BackRight"
			else:
				$Player/AnimatedSprite2D.animation = anim_name+"Right"
		elif Player.velocity.x < 0:
			if Player.velocity.y > 0:
				$Player/AnimatedSprite2D.animation = anim_name+"ForLeft"
			elif Player.velocity.y < 0:
				$Player/AnimatedSprite2D.animation = anim_name+"BackLeft"
			else:
				$Player/AnimatedSprite2D.animation = anim_name+"Left"
		else:
			if Player.velocity.y > 0:
				$Player/AnimatedSprite2D.animation = anim_name+"For"
			elif Player.velocity.y < 0:
				$Player/AnimatedSprite2D.animation = anim_name+"Back"
			else:
				$Player/AnimatedSprite2D.animation = "MeleeFor"

	

extends CharacterBody2D

class_name Enemy

@export var max_health = 100
@onready var health = max_health

@export var player: Node2D
@export var speed = 100

var rng = RandomNumberGenerator.new()
var facing_direction
@export var idle_time_seconds = 2
var idle_timer = 0

@onready var AnimatedSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

var dead = false
@export var enableFlip = false
func makepath():
	if player:
		print("makepath success")
		nav_agent.target_position = player.get_node("Player").global_position
func _ready():
	makepath()

func _physics_process(delta):
	if velocity.x<0 and enableFlip:
		AnimatedSprite.flip_h = true
	else:
		AnimatedSprite.flip_h = false
	if idle_timer > 0:
		idle_timer-=delta
	if !dead:
		if player:
			var dir = to_local(nav_agent.get_next_path_position()).normalized()
#			print(nav_agent.get_next_path_position())
			velocity = dir*speed
		elif idle_timer <= 0: # player is invalid or is away
			idle_timer = idle_time_seconds
			# random movement:
			# steer to random direction
			# move said direction for random time or until collision
			# repeat
			randomize_direction()
			velocity = Vector2(cos(facing_direction), sin(facing_direction))*speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func randomize_direction():
	facing_direction = rng.randf_range(0, 2*PI)


func _on_timer_timeout():
#	print("_on_timer_timeout")
	makepath()

func attacked(damage):
	health-=damage
	if health <= 0:
		dead = true
		AnimatedSprite.play("Death")


func _on_animated_sprite_2d_animation_finished():
	if AnimatedSprite.animation == "Death":
		queue_free()


func _on_area_2d_area_entered(area):
	if area.is_in_group("projectile"):
		attacked(10)# Replace with function body.
		AnimatedSprite.modulate = Color.RED
		await get_tree().create_timer(0.1).timeout
		AnimatedSprite.modulate = Color.WHITE

extends CharacterBody2D


@export var speed = 50
var player_position
var target_position
@onready var player = get_parent().get_node("Player")

var move_timer = 0.0
var move_interval = 0.0
var move_direction = Vector2.ZERO
var rng = RandomNumberGenerator.new()

func _ready():
	choose_new_direction()


func _physics_process(delta):
	move_timer -= delta
	
	if move_timer <= 0:
		choose_new_direction()
	
	var space_state = get_world_2d().direct_space_state
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	# useglobal coordinates, not local to node
	var query = PhysicsRayQueryParameters2D.create(position, player_position)
	var result = space_state.intersect_ray(query)
	
	if position.distance_to(player_position) < 500 and result.has("collider"):
		if result.collider == player:
			move_and_collide(target_position * speed)
		else:
			move_and_collide(move_direction * speed)
	else:
		move_and_collide(move_direction * speed)




func choose_new_direction():
	move_interval = rng.randi_range(5, 8)
	move_timer = move_interval
	move_direction = Vector2(randf_range(-10,10), randf_range(-10,10)).normalized()

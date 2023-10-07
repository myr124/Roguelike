extends CharacterBody2D


@export var speed = 50
var player_position
var target_position
var direction
@onready var player = get_parent().get_node("Player")
# Direction timer
var rng = RandomNumberGenerator.new()
var timer = 0

func _ready():
	rng.randomize()
	direction = Vector2(1,1)




func _physics_process(delta):
	var space_state = get_world_2d().direct_space_state
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	# useglobal coordinates, not local to node
	var query = PhysicsRayQueryParameters2D.create(position, player_position)
	var result = space_state.intersect_ray(query)
	
	if position.distance_to(player_position) > 1 and result.has("collider"):
		if result.collider == player:
			move_and_collide(target_position * speed)
		elif(direction != null):
			move_and_collide(direction * speed)
			
		#if the enemy collides with other objects, turn them around and re-randomize the timer countdown
		elif(result.collider != player):
			#direction rotation
			direction = direction.rotated(rng.randf_range(PI/4, PI/2))
			#timer countdown random range
			timer = rng.randf_range(2, 5)
		#if they collide with the player 
		#trigger the timer's timeout() so that they can chase/move towards our player
		else:
			timer = 0


func on_timer_timeout():
	#this will generate a random direction value
	var random_direction = rng.randf()
	#This direction is obtained by rotating Vector2.DOWN by a random angle.
	if random_direction < 0.05:
		#enemy stops
		direction = Vector2.ZERO
	elif random_direction < 0.1:
		#enemy moves
		direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI)

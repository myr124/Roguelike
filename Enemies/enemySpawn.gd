extends Area2D

var enemy = get_parent().get_node("Basic Enemy")
@onready var collisionShape = get_node("Map/CollisionShape2D")
var spawn_interval = 2.0  # Adjust the spawning interval as needed
@onready var spawn_timer = $Timer

func _ready():
	# Connect the timeout signal of the timer to the spawn_enemy function
	spawn_timer.connect("timeout", spawn_enemy)
	# Start the timer
	spawn_timer.start(spawn_interval)

func spawn_enemy():
	# Generate a random position within the area
	var spawn_position = Vector2(randf_range(collisionShape.rect_min.x, collisionShape.rect_max.x), randf_range(collisionShape.rect_min.y, collisionShape.rect_max.y))

	# Instantiate an enemy at the random position
	var enemy_instance = enemy.instance()
	enemy_instance.position = spawn_position
	add_child(enemy_instance)

	# Restart the timer for the next spawn
	spawn_timer.start(spawn_interval)

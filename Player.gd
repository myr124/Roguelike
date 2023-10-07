extends CharacterBody2D

@export var speed = 400
@onready var sprite = get_node("AnimatedSprite2D")
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	print(input_direction)

func _process(delta):
	get_input()
	sprite.play("Walk")
	move_and_slide()

extends Area2D

@export var speed = 300
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += speed*direction*delta


func destroy():
	queue_free()
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()

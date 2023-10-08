extends Area2D

@export var speed = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	$Firesound.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$FireBall.play()
	$FireBall.animation = "projectile"
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += speed*direction*delta
	


func destroy():
	queue_free()
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()
	

func _on_body_entered(body):
	if body.is_in_group("Walls"):
		destroy() 
	if body.is_in_group("enemy"):
		destroy()


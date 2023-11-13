extends Node2D

func _ready():
	print("Ready")

func _process(delta):
	print(get_child_count())
	if get_child_count()==0:
		get_tree().change_scene_to_file("res://Stages/Stage3.tscn")
	

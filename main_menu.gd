extends Node2D


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://stage.tscn")


func _on_quit_button_pressed():
	get_tree().quit()

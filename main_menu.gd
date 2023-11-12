extends Node2D

var currency = 50

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Stages/Stage.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_store_button_pressed():
	get_tree().change_scene_to_file("res://Store.tscn")

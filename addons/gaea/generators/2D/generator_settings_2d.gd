@icon("../generator_settings.svg")
class_name GeneratorSettings2D
extends Resource
## @tutorial(Gaea's Structure): https://benjatk.github.io/Gaea/#/structure


@export var modifiers: Array[Modifier2D] # TODO: Replace with custom control for easier editing. Similar to Blender.


func _init() -> void:
	if resource_name == "":
		resource_name = "Settings"

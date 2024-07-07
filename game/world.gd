extends Node2D
class_name World

@onready var world_generator: WorldGenerator = $WorldGenerator
@onready var camera_2d: Camera2D = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func move_relative(relative_offset: Vector2) -> void:
	camera_2d.position -= relative_offset / ( 2.0 * SettingsManager.mouse_drag_sensitivity)

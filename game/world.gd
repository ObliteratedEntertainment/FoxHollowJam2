extends Node2D
class_name World

@onready var world_generator: WorldGenerator = $WorldGenerator
@onready var camera_2d: Camera2D = $Camera2D

@onready var effect_location: Sprite2D = $EffectLocation
@onready var npc_manager: Node2D = $NpcManager
@onready var fog_of_war: FogManager = $FogOfWar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func move_relative(relative_offset: Vector2) -> void:
	camera_2d.position -= relative_offset / ( 2.0 * SettingsManager.mouse_drag_sensitivity)
	
	fog_of_war.update_viewport(camera_2d.position)

func start_activating_effect(effect: Card, location: Vector2) -> void:
	effect_location.visible = true
	effect_location.position = location + camera_2d.position - Vector2(640, 360)/2.0
	pass

func apply_effect(effect: Card, location: Vector2) -> void:
	var world_loc := location + camera_2d.position - Vector2(640, 360)/2.0
	effect_location.visible = false
	
	npc_manager.send_task(world_loc)

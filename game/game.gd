extends Control
class_name Game



@onready var world: World = $World

@onready var loading: LoadingScreen = $Loading

@onready var card_placement: Control = $HUD/CardPlacement

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loading.watch(world.world_generator)
	
	world.world_generator.start()
	
	card_placement.dragging_world.connect(world.move_relative)

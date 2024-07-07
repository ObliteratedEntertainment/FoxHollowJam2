extends CanvasLayer
class_name LoadingScreen

signal loading_finished()

@onready var screen: Control = $Screen

@onready var message: Label = $Screen/Message
@onready var percentage: Label = $Screen/Percentage


var fadeout_tween: Tween = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true


func watch(generator: WorldGenerator) -> void:
	
	generator.generation_percentage.connect(_on_generation_percentage)
	generator.generation_step.connect(_on_generation_step)
	generator.generation_finished.connect(_on_generation_finished)
	

func _on_generation_percentage(percent: float) -> void:
	percentage.text = "%0.2f" % [percent]  + "%"

func _on_generation_step(step: String) -> void:
	if "." not in step:
		step += "..."
	message.text = step

func _on_generation_finished() -> void:
	if fadeout_tween != null:
		fadeout_tween.kill()
	
	fadeout_tween = create_tween()
	fadeout_tween.tween_property(screen, "modulate:a", 1.0, 1.0)
	fadeout_tween.tween_callback(self._on_finished)

func _on_finished() -> void:
	
	visible = false
	loading_finished.emit()

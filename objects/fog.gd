extends Area2D
class_name Fog

const FADED = 0.5

signal cleared()
signal faded()

var tweener: Tween = null

@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("idle", -1, randf_range(0.4, 0.6))

func clear_out() -> void:
	if tweener != null:
		return
	cleared.emit()
	tweener = create_tween()
	tweener.tween_property(self, "modulate:a", 0.0, 1.0)
	tweener.tween_callback(self.queue_free)

func dim() -> void:
	faded.emit()
	modulate.a = FADED

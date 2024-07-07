extends Control
class_name Card

enum CardBackType {
	NATURE,
	METAL,
	HEART,
	GOLD
}

signal focus_start()
signal focus_end()

signal card_selected()

@onready var mouse_detector: ColorRect = $MouseDetector
@onready var texture_rect: TextureRect = $TextureRect

var saved_position := Vector2.ZERO

@export var card_type := CardBackType.NATURE

var selectable := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_detector.mouse_entered.connect(_on_mouse_enter)
	mouse_detector.mouse_exited.connect(_on_mouse_exit)
	mouse_detector.gui_input.connect(_gui_input)
	_set_back_type()

func set_selectable(select: bool) -> void:
	selectable = select

func _on_mouse_enter() -> void:
	if not selectable:
		return
	focus_start.emit()
	
	z_index = 100
	saved_position = position
	position = saved_position + Vector2.UP * 80

func _on_mouse_exit() -> void:
	if not selectable:
		return
	focus_end.emit()

	reset_position()

func reset_position():
	z_index = 0
	position = saved_position

func _gui_input(event: InputEvent) -> void:
	if not selectable:
		return
	
	if event.is_pressed():
		card_selected.emit()


func _set_back_type() -> void:
	var rect = Rect2(texture_rect.texture.region)
	rect.position.x = 128.0 * card_type
	texture_rect.texture.region = rect

extends Control

signal dragging_world(relative: Vector2)

@onready var hand: Hand = $Hand
@onready var drop_zone: NinePatchRect = $DropZone


var dragging := false
var dragging_card: Card = null
var start_drag_pos: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.gui_input.connect(_input)
	hand.dragging_card.connect(_on_dragging_card)
	drop_zone.visible = false
	
func _input(event: InputEvent) -> void:
	if dragging_card == null:
		
		if event is InputEventMouseMotion and event.button_mask != 0:
			dragging_world.emit(event.relative)
	else:
		var drop_rect = Rect2(drop_zone.global_position, drop_zone.size)
		
		if event is InputEventMouseMotion:
			var offset := Vector2.LEFT * 35 + Vector2.UP * 32
			dragging_card.position = event.position - start_drag_pos + offset
			drop_zone.highlight(drop_rect.has_point(dragging_card.global_position - offset))
		elif not event.is_pressed():
			if drop_rect.has_point(dragging_card.global_position):
				print("Consuming card")
				hand.consume_card(dragging_card)
			else:
				print("Releasing card")
				hand.released_card()
			dragging_card = null
			z_index = 0
			drop_zone.visible = false
			drop_zone.highlight(false)
		else:
			drop_zone.highlight(false)

func _on_dragging_card(card: Card) -> void:
	drop_zone.visible = true
	start_drag_pos = card.get_parent().global_position
	dragging_card = card
	z_index = 100

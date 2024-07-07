extends HBoxContainer
class_name Hand

signal dragging_card(card: Card)

var holding_card: Card = null
var original_position: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for card: Card in get_children():
		card.card_selected.connect(_on_card_selected.bind(card))


func _on_card_selected(card: Card) -> void:
	
	for child in get_children():
		child.set_selectable(false)
	
	holding_card = card
	original_position = card.position
	#holding_card.visible = false
	dragging_card.emit(holding_card)

func consume_card(card: Card) -> void:
	remove_child(card)
	holding_card = null
	for child in get_children():
		child.set_selectable(true)

func released_card() -> void:
	if holding_card != null:
		holding_card.visible = true
		holding_card.reset_position()
		holding_card = null
	
	for child in get_children():
		child.set_selectable(true)

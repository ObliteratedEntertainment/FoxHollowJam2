extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func send_task(location: Vector2) -> void:
	
	for child: NPC in get_children():
		child.move_towards(location)
		break

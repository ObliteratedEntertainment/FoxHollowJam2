extends NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highlight(false)


func highlight(show: bool) -> void:
	if show:
		modulate.a = 0.75
	else:
		modulate.a = 0.25

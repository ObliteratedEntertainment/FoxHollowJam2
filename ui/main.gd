extends Control

const GAME = preload("res://game/game.tscn")


@onready var start: TextureButton = $MainMenu/VBoxContainer/Start
@onready var settings: TextureButton = $MainMenu/VBoxContainer/Settings


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.pressed.connect(_on_start)
	settings.pressed.connect(_on_settings)
	


func _on_start() -> void:
	get_tree().change_scene_to_packed(GAME)
	

func _on_settings() -> void:
	pass

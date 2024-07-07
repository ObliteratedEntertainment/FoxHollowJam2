extends CharacterBody2D
class_name NPC

const SPEED = 40.0

@onready var cave_man: Sprite2D = $CaveMan
@onready var cave_woman: Sprite2D = $CaveWoman
@export var is_female := false

@onready var fog_clear: Area2D = $FogClear
@onready var fog_dim: Area2D = $FogDim

@onready var sfx_action: AudioStreamPlayer2D = $SFXAction

var is_idle := true
var is_running := false
var is_action := false

var has_task := false
var destination := Vector2.ZERO


func _ready() -> void:
	
	is_female = randf() > 0.5

	cave_woman.visible = is_female
	cave_man.visible = not is_female
	
	fog_clear.area_entered.connect(_on_fog_entered)
	fog_dim.area_entered.connect(_on_fog_dim)
	

func _physics_process(delta: float) -> void:

	if not has_task:
		return

	if position.distance_to(destination) > 1.0:
		
		var direction := position.direction_to(destination)
		
		velocity = direction * SPEED
		
		move_and_slide()
		
		var needs_flip := direction.x < 0.0
		cave_man.flip_h = needs_flip
		cave_woman.flip_h = needs_flip
		
	else:
		velocity = Vector2.ZERO

	if velocity != Vector2.ZERO:
		is_idle = false
		is_action = false
		is_running = true
	else:
		is_running = false
		if has_task:
			is_action = true
			is_idle = false
		else:
			is_action = false
			is_idle = true


func move_towards(location: Vector2) -> void:
	destination = location
	has_task = true


func _anim_action_progress():
	sfx_action.play()

func _on_fog_entered(area: Area2D) -> void:
	if area is Fog:
		area.clear_out()

func _on_fog_dim(area: Area2D) -> void:
	if area is Fog:
		area.dim()

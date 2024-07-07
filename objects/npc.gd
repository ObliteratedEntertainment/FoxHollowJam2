extends AnimatableBody2D
class_name NPC

const SPEED = 40.0

@onready var cave_man: Sprite2D = $CaveMan
@onready var cave_woman: Sprite2D = $CaveWoman
@export var is_female := false

@onready var sfx_action: AudioStreamPlayer2D = $SFXAction

var is_idle := true
var is_running := false
var is_action := false

var has_task := false
var destination := Vector2.ZERO

var velocity := Vector2.ZERO

func _ready() -> void:

	cave_woman.visible = is_female
	cave_man.visible = not is_female
	

func _physics_process(delta: float) -> void:

	if not has_task:
		return

	if position.distance_to(destination) > 1.0:
		
		var direction := position.direction_to(destination)
		
		velocity = direction * SPEED
		
		move_and_collide(velocity * delta)
		
		#position = Vector2(int(position.x), int(position.y))
		
		
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

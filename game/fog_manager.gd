extends Node2D
class_name FogManager

const FOG = preload("res://objects/fog.tscn")


var track_cleared_fog := {}
var track_faded_fog := {}

var currently_visible := {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_viewport(Vector2.ZERO)

func update_viewport(position: Vector2) -> void:
	
	var root_pos := Vector2i(int(position.x/16.0)*16, int(position.y/16.0)*16)
	
	var safe_coords = {}
	
	for x in range(-30, 30):
		for y in range(-30, 30):
			var pos := root_pos + Vector2i(x,y) * 16
			_create_fog(pos)
			
			if pos.x not in safe_coords:
				safe_coords[pos.x] = {}
			safe_coords[pos.x][pos.y] = {}

	for x in currently_visible.keys():
		for y in currently_visible[x].keys():
			if x in safe_coords and y in safe_coords:
				return
			
			var fog: Fog = currently_visible[x][y]
			remove_child(fog)
			currently_visible[x].erase(y)
			fog.queue_free()
	
	print("Current Fog Children: ", get_child_count())
			

func cleared_out(fog: Fog) -> void:
	var x = int(fog.position.x)
	var y = int(fog.position.y)
	if x not in track_cleared_fog:
		track_cleared_fog[x] = {}
	
	track_cleared_fog[x][y] = true
	
	if x in currently_visible and y in currently_visible[x]:
		currently_visible[x].erase(y)

func faded(fog: Fog) -> void:
	var x = int(fog.position.x)
	var y = int(fog.position.y)
	if x not in track_faded_fog:
		track_faded_fog[x] = {}
	
	track_faded_fog[x][y] = true

func _create_fog(position: Vector2i) -> void:
	var x = int(position.x)
	var y = int(position.y)
	
	if x in track_cleared_fog and y in track_cleared_fog[x]:
		return
	elif x in currently_visible and y in currently_visible[x]:
		return
	
	
	var cloud := FOG.instantiate()
	
	cloud.cleared.connect(cleared_out.bind(cloud))
	cloud.faded.connect(faded.bind(cloud))
	
	if x in track_faded_fog and y in track_faded_fog[x]:
		cloud.modulate.a = Fog.FADED
	
	cloud.position = position
	add_child(cloud)
	
	if x not in currently_visible:
		currently_visible[x] = {}
	currently_visible[x][y] =  cloud
	

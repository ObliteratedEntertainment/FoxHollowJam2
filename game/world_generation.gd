extends Node
class_name WorldGenerator

signal generation_started()
signal generation_percentage(percentage: float)
signal generation_step(phase: String)
signal generation_finished()

const TERRAIN_SIZE := 12

@export var frequency := 10.0
@export var fractal_octaves := 2.0
@export var fractal_lacunarity := 3.0
@export var fractal_gain := 10.0

var terrain_rng := FastNoiseLite.new()


var terrain := {}

var started := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	terrain_rng.noise_type = FastNoiseLite.TYPE_SIMPLEX
	terrain_rng.frequency = frequency
	terrain_rng.fractal_octaves = fractal_octaves
	terrain_rng.fractal_lacunarity = fractal_lacunarity
	terrain_rng.fractal_gain = fractal_gain
	
	set_process(false)


func start() -> void:
	started = true
	
	_generate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _generate() -> void:
	
	generation_step.emit("Sculpting terrain")
	await get_tree().process_frame
	
	var counter := 0.0
	for x in range(TERRAIN_SIZE):
		terrain[x] = {}
		for y in range(TERRAIN_SIZE):
			
			terrain[x][y] = terrain_rng.get_noise_2d(x, y)
			
			counter += 1
			
		generation_percentage.emit(100.0 * (counter / float(TERRAIN_SIZE * TERRAIN_SIZE)))

		await get_tree().process_frame
	
	generation_step.emit("Planting trees")
	await get_tree().process_frame
	
	counter = 0.0
	for x in range(TERRAIN_SIZE):
		terrain[x] = {}
		for y in range(TERRAIN_SIZE):
			
			terrain[x][y] = terrain_rng.get_noise_2d(x, y)
			
			counter += 1
			
		generation_percentage.emit(100.0 * (counter / float(TERRAIN_SIZE * TERRAIN_SIZE)))

		await get_tree().process_frame
	
	
	await get_tree().process_frame
	
	# Finished generation
	started = false
	set_process(false)
	generation_step.emit("World Generation Complete.")
	generation_finished.emit()

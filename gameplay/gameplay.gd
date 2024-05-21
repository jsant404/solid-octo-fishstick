extends Node2D

#func _process(_delta: float) -> void:
	#$Icon.rotate(_delta)
	
@export var noise_height_text: NoiseTexture2D
@onready var tile_map = $TileMap

var noise : Noise
var width : int = 960
var height : int = 540

# tilesets
var source_iso_ground = 3
var source_gore_pile = 1
var ground_6 =  Vector2i(4,2) #  stone floor
var ground_7 =  Vector2i(5, 2) 
var ground_8 =  Vector2i(6, 2)
var ground_9 =  Vector2i(7,2)
var ground_1 =  Vector2i(8,2) # grass
var ground_2 =  Vector2i(9,2)
var ground_3 =  Vector2i(10,2)
var ground_4 =  Vector2i(11,2)
var ground_5 =  Vector2i(0,4) # dirt 
var ground_10 =  Vector2i(1,4)
var ground_11 =  Vector2i(2,4)
var ground_12 =  Vector2i(3,4)
var ground_13 =  Vector2i(0,6) # black floor
var ground_14 =  Vector2i(1,6)
var ground_15 =  Vector2i(2,6)
var ground_16 =  Vector2i(3,6)
var ground_17 =  Vector2i(4,9) # hay stone
var ground_18 =  Vector2i(5,9)
var ground_19 =  Vector2i(6,9)
var ground_20 =  Vector2i(7,9)







func _ready():
	noise = noise_height_text.noise
	generate_world()
	
func generate_world():
	
	for x in range(noise_height_text.width):
		for y in range(noise_height_text.height): #4.6
			var noise_val = noise.get_noise_2d(x, y)
			if noise_val > 0.95:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_20)
			elif noise_val > 0.9:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_19)
			elif noise_val > 0.85:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_18)
			elif noise_val > 0.8:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_17)
			elif noise_val > 0.75:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_16)
			elif noise_val > 0.7:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_15)
			elif noise_val > 0.65:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_14)
			elif noise_val > 0.6:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_13)
			elif noise_val > 0.55:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_12)
			elif noise_val > 0.5:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_11)
			elif noise_val > 0.45:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_10)
			elif noise_val > 0.4:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_9)
			elif noise_val > 0.35:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_8)
			elif noise_val > 0.3:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_7)
			elif noise_val > 0.25:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_6)
			elif noise_val > 0.2:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_5)
			elif noise_val > 0.15:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_4)
			elif noise_val > 0.1:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_3)
			elif noise_val >= 0.5:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_2)
			else: 
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_1)

func _input(event: InputEvent) -> void:
	if event.is_action_released("pause"):
		call_deferred("_pause")
		
func _pause() -> void:
	$Paused.pause()
	get_tree().paused = true

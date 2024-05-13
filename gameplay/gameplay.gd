extends Node2D

#func _process(_delta: float) -> void:
	#$Icon.rotate(_delta)
	
@export var noise_height_text: NoiseTexture2D
@onready var tile_map = $TileMap
@onready var nav_region = $NavigationRegion2D
var noise : Noise
var width : int = 960
var height : int = 540

# tilesets
var source_iso_ground = 0
var source_gore_pile = 1
var ground_1 =  Vector2i(10,1)
var ground_2 =  Vector2i(6, 1)
var ground_3 =  Vector2i(3, 1)
var ground_4 =  Vector2i(3,0)
var ground_5 =  Vector2i(7,0)
var ground_6 =  Vector2i(8,0)
var ground_7 =  Vector2i(6,2)
var ground_8 =  Vector2i(5,2)
var ground_9 =  Vector2i(1,3)
var ground_10 =  Vector2i(2,3)



func _ready():
	noise = noise_height_text.noise
	generate_world()
	
func generate_world():
	
	for x in range(width):
		for y in range(height):
			var noise_val = noise.get_noise_2d(x, y)
			if noise_val > 0.9:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground,ground_10 )
			elif noise_val > 0.8:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_9)
			elif noise_val > 0.7:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_8)
			elif noise_val > 0.6:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_7)
			elif noise_val > 0.5:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_6)
			elif noise_val > 0.4:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_5)
			elif noise_val > 0.3:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_4)
			elif noise_val > 0.2:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_3)
			elif noise_val > 0.1:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_2)
			elif noise_val >= 0.0:
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_1)
			else: 
				tile_map.set_cell(0,Vector2(x,y), source_iso_ground, ground_9)

func _input(event: InputEvent) -> void:
	if event.is_action_released("pause"):
		call_deferred("_pause")
		
func _pause() -> void:
	$Paused.pause()
	get_tree().paused = true

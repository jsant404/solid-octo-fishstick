extends Marker2D

@onready var shieldCast  = $"../../../abilities/shieldCast"
@onready var pulseFire = $"../../../abilities/pulseFire"
@onready var windBullet = $"../../../abilities/windBullet"
@onready var mage = $"../../.."
@onready var radiusCircle = $".." 
@export var radius = 5
@onready var projectileSpawner = $"."
@export var speed = 100
 
var activeHit = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var player_pos = mage.global_transform.origin 
	var distance = player_pos.distance_to(mouse_pos) 
	var mouse_dir = (mouse_pos-player_pos).normalized()
	if distance > radius:
		mouse_pos = player_pos + (mouse_dir * radius)
	projectileSpawner.global_transform.origin = mouse_pos
	
	
	
		
	

extends Node2D

var is_ready = true

@onready var anim_sprite = $"../AnimatedSprite2D"# Called when the node enters the scene tree for the first time.
@onready var player = $".."# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and is_ready:
		player.action = "proces"
		var random_float = randf()
		#anim_sprite.play("atk") 
		if random_float < 0.8:
			# 80% chance of being returned.
			anim_sprite.play("atk") 
		elif random_float < 0.95:
			# 15% chance of being returned.
			anim_sprite.play("atk_2") 
		else:
			# 5% chance of being returned.
			anim_sprite.play("atk_2") 
		is_ready = false
		$atkCooldown.start()  
		
			
			

func _on_cooldown_timeout():
	is_ready = true
	player.action = "idle"
	pass # Replace with function body.

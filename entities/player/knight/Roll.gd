extends Node2D

var is_ready = true

@onready var anim_sprite = $"../AnimatedSprite2D"# Called when the node enters the scene tree for the first time.
@onready var player = $".."# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("special") and is_ready:
		player.action = "process"
		anim_sprite.play("roll") 
		is_ready = false
		$Cooldown.start() 
		player.addSpeed(450)
		
	if anim_sprite.animation == "roll" && anim_sprite.frame_progress == 1:
			anim_sprite.play("idle")
			player.remSpeed(450)
			player.action = "idle"
			
			

func _on_cooldown_timeout():
	is_ready = true
	pass # Replace with function body.

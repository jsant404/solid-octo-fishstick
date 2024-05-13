extends CharacterBody2D

@export var SPEED = 300
@export var ATK_DMG = 100
@export var COOLDOWN = 10
@export var ACCEL = 20
var action = "idle"

@onready var anim_sprite = $AnimatedSprite2D

func _ready():
	anim_sprite.animation = "idle"
		
func player():
	pass

func addSpeed(inc):
	SPEED += inc
func remSpeed(inc):
	SPEED -= inc
		
func _physics_process(delta):
	
	var direction = null
	if action== "idle":
		direction = Input.get_vector("right", "left", "up", "down")
		#velocity.x = move_toward(velocity.x, SPEED * direction.x, 1)
		#velocity.y = move_toward(velocity.y, SPEED * direction.y, 1)
		velocity = direction * SPEED
	if velocity.x > 0:
		if action ==  "idle":
			anim_sprite.play("run")
		anim_sprite.flip_h = false
	elif velocity.x < 0:
		if action ==  "idle":
			anim_sprite.play("run")
		anim_sprite.flip_h = true
	elif velocity.y != 0: 
		if action ==  "idle":
			anim_sprite.play("run")
	elif action == "idle":
		anim_sprite.play("idle")
	
	move_and_slide()
 

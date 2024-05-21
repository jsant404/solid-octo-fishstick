extends CharacterBody2D

@export var SPEED = 300
@export var ATK_DMG = 100
@export var COOLDOWN = 10
@export var ACCEL = 20
var prev_action = 0
var action = "idle"
var auto_atk = false
var active_ability_list = []
 
@onready var anim_sprite = $AnimatedSprite2D
func addAbility(name):
	active_ability_list.append(name)
	
 
func enableAutoAtk():
	if auto_atk:
		auto_atk = false
	else: 
		auto_atk = true

func _ready():
	anim_sprite.animation = "idle"
		
func player():
	pass

func addSpeed(inc):
	SPEED += inc
func remSpeed(inc):
	SPEED -= inc
		
func _physics_process(delta):
	if Input.is_action_just_pressed("auto_atk"):
		print("auto")
		enableAutoAtk()
	
	var direction = null
	if action== "idle":
		direction = Input.get_vector("right", "left", "up", "down")
		#velocity.x = move_toward(velocity.x, SPEED * direction.x, 1)
		#velocity.y = move_toward(velocity.y, SPEED * direction.y, 1)
		velocity = direction * SPEED
	if velocity.x > 0:
		if prev_action < 0:
			anim_sprite.play("transition")
			
			
		if action ==  "idle":
			anim_sprite.play("run")
			prev_action = velocity.x
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



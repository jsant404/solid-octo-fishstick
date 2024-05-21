extends CharacterBody2D

@onready var main 
@export var SPEED = 300
@export var ATK_DMG = 100
@export var COOLDOWN = 10
@export var ACCEL = 20
var prev_action = 0
var action = "idle"
@export var auto_atk = false
@onready var shieldCast = $abilities/shieldCast
@onready var fireCast = $abilities/fireCast
@onready var basicAttack = $abilities/basicAttack
@onready var fireBall = $abilities/fireBall
var abilities = [
	shieldCast,
	fireCast,
	basicAttack,
	fireBall
]
@onready var anim_sprite = $AnimatedSprite2D
var actionLock = false
var activeHit = false

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
	
func isPlayer():
	pass
			
func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mousePos = get_global_mouse_position()
		if $'.'.global_position.x - mousePos.x > 0:
			anim_sprite.flip_h = true
		else:
			anim_sprite.flip_h = false
		
	
	
	if Input.is_action_pressed("auto_atk"):
		enableAutoAtk()
	
	anim_sprite.position= $".".global_position
	
	
		#if mousePos.x - $".".global_position.x > 0:
			#anim_sprite.flip_h = true
		#else: 
			#anim_sprite.flip_h = false
		
	
	var direction = null
	direction = Input.get_vector( "ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED 
	#if action== "idle":
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && activeHit == false:
		activeHit = true
		anim_sprite.play("atk-2")
 
	if Input.is_action_pressed("auto_atk") && activeHit == false:
		activeHit = true 
		$"../cooldown".autostart = true
		
	if Input.is_action_just_pressed("auto_atk") && activeHit == true:
		$"../cooldown".autostart = false
		
		
	if velocity.x > 0:
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
	



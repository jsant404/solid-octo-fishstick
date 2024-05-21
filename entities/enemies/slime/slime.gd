extends CharacterBody2D

@onready var main = get_node("res://gameplay/gameplay.tscn")
@export var player: Node2D
var player_chase= false
var SPEED = 50
var target
@onready var anim = $AnimatedSprite2D2
@onready var timer = $Timer

var randomNum
enum {
	SURROUND,
	ATTACK, 
	HIT
}
var state = SURROUND 

func activateAttack():
	state = ATTACK
func activateHit():
	state = HIT
func activateSurround():
	state = SURROUND

func isEnemy():
	return true

func _on_timer_timeout():
	if anim.animation == "move" && state == ATTACK:
		anim.play("attack")
		
	
		


func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	randomNum = rng.randf() 


func _physics_process(delta):
	
	if player.global_position.x - global_position.x > 0:
		anim.flip_h = true
	else: 
		anim.flip_h = false
	
	if anim.frame_progress == 1 && anim.animation == "attack": 

		var knockback = 500 
		
		
	match state:
		SURROUND:
			move(get_circle_position(randomNum), delta)
			anim.animation = "move"
		ATTACK: 
			move(player.global_position, delta)
			anim.animation = "attack"
		HIT:
			move(player.global_position, delta)
			
func move (target, delta): 
	var direction = (target - global_position).normalized()
	var desired_velocity = direction * SPEED
	var steering = (desired_velocity - velocity) * delta * 2.5
	velocity += steering
	move_and_slide()

 
	
	

func get_circle_position(random):
	var kill_circle_center = player.global_position
	var radius = 30
	var angle = random * PI * 2
	var x = kill_circle_center.x + cos(angle) * radius
	var y = kill_circle_center.y + sin(angle) * radius
	return Vector2(x,y)


func _on_area_2d_body_entered(body):
	if body.has_method("isPlayer") && state != ATTACK:
		print("enemy in range")
		state = ATTACK
		timer.start()
		


func _on_area_2d_body_exited(body):
	if body.has_method("isPlayer"):
		activateSurround()
		timer.stop()

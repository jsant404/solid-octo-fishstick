extends CharacterBody2D

@onready var main = get_node("res://gameplay/gameplay.tscn")
@export var player: Node2D
var player_chase= false
@onready var nav_agent = $NavigationAgent2D as NavigationAgent2D
var entered : bool 
var alive : bool
var speed : int = 40
var direction : Vector2
var drop_chance: float = 0.2


func _ready():
	makepath()
	
func _physics_process(delta):
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()
	
func makepath() -> void: 
	nav_agent.target_position = player.global_position

func _on_timer_timeout():
	makepath()
#TODO: fix route generator towards player (navigation tile) 

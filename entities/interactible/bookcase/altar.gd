extends Area2D
@export var dialog_key = ""
var state = "open"
var player_in_area = false
@onready var timer = $"../storeRefresh"
@onready var label = $"../Label"


# Called when the node enters the scene tree for the first time.
func _ready():
	if state == "open":
		$"../storeRefresh".start()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area:
		label.visible = true
	else: 
		label.visible = false
	
	if state == "open" && player_in_area:
		if Input.is_action_just_pressed("interact"):
			state="closed"
			$"../storeRefresh".start()
			

#func _input(event):
	#if player_in_area and event.is_action_pressed("interact"):
		#$"../CanvasGroup/Label".visible = true

func _on_body_entered(body):
	if body.has_method("player"):
		player_in_area = true
		
	print("interact")

func _on_body_exited(body):
	if body.has_method("player"):
		player_in_area = false

func _on_timer_timeout():
	if state == "closed":
		state = "open"
	

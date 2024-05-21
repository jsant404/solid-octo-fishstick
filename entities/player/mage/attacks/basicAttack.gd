extends Area2D

 

@onready var mage = $"../AnimatedSprite2D"
@onready var mage_action = $".."
@onready var basicAttack = $basicAttack
@onready var atkArea = $atkColl
var activeHit = false
# Called when the node enters the scene tree for the first time.
var enemiesInRange = []
 
 
 
func _process(delta):
 	#basicAttack.position = mage_action.position
	basicAttack.position.x = mage_action.position.x 
	basicAttack.position.y = mage_action.position.y - 20
	

	
	if mage.frame_progress == 1 && mage.animation == "atk":
		mage.animation = "idle"
		mage_action.action = "idle"
 
		
	if basicAttack.frame_progress == 0.4 && activeHit:
		print("enemies in range ", enemiesInRange.length)
			


	if basicAttack.frame_progress == 1 && activeHit:
		basicAttack.visible = false
		activeHit = false


		
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && activeHit == false:
		activeHit = true
		#applyHit()
	if Input.is_action_pressed("auto_atk") && activeHit == false:
		activeHit = true 
		$"../cooldown".autostart = true
		
	if Input.is_action_just_pressed("auto_atk") && activeHit == true:
		$"../cooldown".autostart = false
		




func _on_cooldown_timeout():
	applyHit()
	
	 

func applyHit():
	mage.animation = "atk"
	mage_action.action = "atk"
	basicAttack.visible = true
	#basicAttack.animation = "atk_1"
	basicAttack.play("atk_1")
	


func _on_body_entered(body):
	if body.has_method("isEnemy"):
		enemiesInRange.append(body)


func _on_body_exited(body):
	if body.has_method("isEnemy"):
		enemiesInRange.erase(body)

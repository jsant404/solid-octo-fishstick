extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#get_viewport().size = Vector2(960,720)
	get_viewport().size = DisplayServer.screen_get_size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

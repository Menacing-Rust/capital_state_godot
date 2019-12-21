extends Spatial

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			za_warudo($Body, false)
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			za_warudo($Body, true)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		print('pressed')
		
func za_warudo(node, state = false):
	node.set_process(state)
	node.set_physics_process(state)
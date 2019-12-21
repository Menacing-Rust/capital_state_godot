extends Spatial

onready var camera = $Camera
const MOUSE_SENSITIVITY = 0.005
const VERTICAL_ANGLE = PI/2.1

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		var movement = event.relative
		var rotation = movement * MOUSE_SENSITIVITY * -1
		rotate_y(rotation.x)
		camera.rotate_x(rotation.y)
		
		var rot_limit = camera.rotation
		rot_limit.x = clamp(rot_limit.x, -VERTICAL_ANGLE, VERTICAL_ANGLE)
		camera.rotation = rot_limit
extends KinematicBody

const SPEED = 14
const GRAVITY = Vector3(0, -24, 0)
const JUMP = Vector3(0, 24, 0)
const AIR_RESISTANCE = Vector3(0.95, 1.0, 0.95)
const HORIZONTAL = Vector3(1, 0, 1)
const VERTICAL = Vector3(0, 1, 0)

var motion = Vector3()
var impulse = Vector3()

func _physics_process(delta):
	handle_input()
	handle_movement(delta)
	
func handle_input():
	var direction = Vector3()
	var raw_input = Vector3()
	
	if Input.is_action_pressed("movement_forward"):
		raw_input += Vector3(0, 0, -1)
	if Input.is_action_pressed("movement_backward"):
		raw_input += Vector3(0, 0, 1)
	if Input.is_action_pressed("movement_left"):
		raw_input += Vector3(-1, 0, 0)
	if Input.is_action_pressed("movement_right"):
		raw_input += Vector3(1, 0, 0)
		
	if is_on_floor() and Input.is_action_pressed("movement_jump"):
		impulse += JUMP
	if is_on_floor() and Input.is_action_pressed("movement_leap"):
		impulse += relative(Vector3(0, 30, -60))
	
	direction = relative(raw_input)
	# Prevent slower movement when look at an angle
	direction *= HORIZONTAL
	direction = direction.normalized()
	impulse += direction * SPEED
	
func handle_movement(delta):
	
	motion *= AIR_RESISTANCE
	motion += impulse
	motion += GRAVITY * delta
	motion = move_and_slide(motion, Vector3(0, 1, 0), false, 4, PI/4, false)
	
	impulse *= 0
	
func relative(vector):
	return $Head.get_global_transform().basis * vector
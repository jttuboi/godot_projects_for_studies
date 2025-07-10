extends CharacterBody3D

#var velocity := Vector3.ZERO
var speed := 5
var jump_force := 6

var gravity := -12
var mouse_rotation := 0.05
var is_jumping := false


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
		velocity.y += gravity * delta
		
		get_input()
		
		if Input.is_action_just_pressed('ui_select') and is_on_floor():
			is_jumping = true
			velocity.y += jump_force
		else:
			is_jumping = false
		
		#var snap_vector = Vector3.DOWN if not is_jumping else Vector3.ZERO
		#velocity = move_and_slide_with_snap(velocity, snap_vector, Vector3.UP, true, 4, deg2rad(70))
		#velocity = move_and_slide(velocity, Vector3.UP, true)
		move_and_slide()

func get_input():
	var input = Vector3.ZERO
	
	if Input.is_action_pressed('ui_up'):
		input += -transform.basis.z * speed # aqui ele pega a posicao local (transform.basis)
		#velocity.z -= speed
	if Input.is_action_pressed('ui_down'):
		input += transform.basis.z * speed
		#velocity.z += speed
	if Input.is_action_pressed('ui_left'):
		input += -transform.basis.x * speed
		#velocity.x -= speed
	if Input.is_action_pressed('ui_right'):
		input += transform.basis.x * speed
		#velocity.x += speed
	
	velocity.x = input.x
	velocity.z = input.z
		
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0.0, mouse_rotation, event.relative.x / 10))
		
	if Input.is_action_just_pressed('ui_cancel') and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if Input.is_action_just_pressed('ui_accept') and Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)




#### codigo basico default

#const SPEED = 5.0
#const JUMP_VELOCITY = 4.5
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()

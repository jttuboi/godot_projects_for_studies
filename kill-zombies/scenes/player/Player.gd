extends KinematicBody2D

signal shoot(direction, location)

var life = 100
var speed = 200
var velocity = Vector2.ZERO
var window = OS.window_size


func _process(delta):
	if (Input.is_action_pressed("ui_shot")):
		emit_signal("shoot", rotation, $Aim.global_position)



func _physics_process(delta):
	calculate_velocity()
	position = position + velocity * delta
	limit_position()



func limit_position():
	if (position.x < 0):
		position.x = 0
	elif (position.x > window.x):
		position.x = window.x
	
	if (position.y < 0):
		position.y = 0
	elif (position.y > window.y):
		position.y = window.y



func calculate_velocity():
	look_at(get_global_mouse_position())
	velocity = Vector2.ZERO
	
	if (Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	if (Input.is_action_pressed("ui_down")):
		velocity.y += 1
	if (Input.is_action_pressed("ui_left")):
		velocity.x -= 1
	if (Input.is_action_pressed("ui_right")):
		velocity.x += 1
	
	velocity = velocity.normalized() * speed
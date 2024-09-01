extends KinematicBody2D

export (int) var speed = 200
export (bool) var camera_enabled = false setget _set_camera
var _velocity = Vector2.ZERO


func _physics_process(_delta: float):
	_velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		_velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		_velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		_velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		_velocity.y -= 1

	_velocity = _velocity.normalized() * speed
	_velocity = move_and_slide(_velocity)


func _set_camera(value: bool):
	$Camera.current = value

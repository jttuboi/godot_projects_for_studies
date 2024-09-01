extends RigidBody2D

var speed = 0
var turn_speed = 0.02
var _max_speed = 500
var _acceleration = 0
var _direction = 0
var _target_rot = 0
var _car_width = 0



func _ready():
	_car_width = $"Sprite".texture.get_size().x
	connect("body_entered", self, "_on_body_entered")
	set_process(true)
	set_process_input(true)



func _input(event):
	_direction = 0
	_target_rot = 0
#	if (event is InputEventMouseButton and not event.is_echo()):
#		if (event.position.x < position.x + _car_width / 2):
#			_target_rot = -5
#			_direction = -1
#		else:
#			_target_rot = 5
#			_direction = 1
	if (Input.is_action_pressed("ui_left")):
		_direction = -1
	if (Input.is_action_pressed("ui_right")):
		_direction = 1
	if (Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right")):
		_direction = 0



func _process(delta):
	speed += _acceleration
	speed = min(speed, _max_speed)
	if (speed < _max_speed):
		_acceleration += delta
	var new_pos = position + Vector2(_direction * turn_speed * speed, 0)
	position = Vector2(clamp(new_pos.x, 0, 640 - _car_width), new_pos.y)
	rotation_degrees = lerp(_target_rot, rotation_degrees, 0.3)



func _on_body_entered(other):
	$"../Camera".shake(0.1,500,10)
	if (other.is_in_group("Enemies")):
		other.hit_by_player()
	speed = 0
	set_process(false)
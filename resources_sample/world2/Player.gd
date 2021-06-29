extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2.ZERO
var temp


func _physics_process(_delta: float):
	get_input()
	velocity = move_and_slide(velocity)


func get_input():
	temp = velocity
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	if velocity != temp:
		Signals.emit_signal("data_updated")


func set_load_data(data: Dictionary):
	position = data.player_position


func get_save_data():
	return {
		"player_position": position,
	}


func show_data():
	prints("player_position =", position)


func clear_data():
	position = Vector2(250, 50)

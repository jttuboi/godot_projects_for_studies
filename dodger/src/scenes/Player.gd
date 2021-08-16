extends Area2D

enum Action { LEFT, RIGHT, MOUSE, IDLE }

const LEFT_BORDER = 0
const RIGHT_BORDER = 500
const CENTER = 250

var action = Action.IDLE
var speed = 200



func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		action = Action.MOUSE
	elif event.is_action_pressed("ui_left"):
		action = Action.LEFT
	elif event.is_action_pressed("ui_right"):
		action = Action.RIGHT
	elif event.is_action_released("ui_left") and action != Action.RIGHT or \
			event.is_action_released("ui_right") and action != Action.LEFT:
		action = Action.IDLE


func _process(delta: float):
	match action:
		Action.LEFT:
			position.x = max(LEFT_BORDER, position.x - speed * delta)

		Action.RIGHT:
			position.x = min(position.x + speed * delta, RIGHT_BORDER)

		Action.MOUSE:
			var smooth_distance := (get_global_mouse_position().x - position.x) / 2
			position.x = clamp(position.x + smooth_distance, 0, RIGHT_BORDER)


func restart_position():
	position.x = CENTER


func _on_Player_area_entered(area: Area2D):
	if area.is_in_group("enemies"):
		Events.emit_signal("player_has_hit")

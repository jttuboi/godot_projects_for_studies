extends KinematicBody2D

var npc_name := ""


func _ready():
	$Name.text = npc_name
	position = Vector2(400, 100)


func _enter_tree():
# warning-ignore:return_value_discarded
	Signals.connect("second_changed", self, "_on_second_changed")


func _on_second_changed(second: int):
	if second % 5 == 0:
		_move()


func _move():
	var direction = Vector2(randi() % 3 - 1, randi() % 3 - 1) # (-1..1, -1..1)
	position += direction * 50
	Signals.emit_signal("data_updated")


func set_load_data(data: Dictionary):
	position = data[_get_key()]


func get_save_data():
	return {
		_get_key(): position,
	}


func show_data():
	prints("npc_" + npc_name + "_position =", position)


func clear_data():
	position = Vector2(400, 100)


func _get_key():
	return "npc_" + npc_name + "_position"

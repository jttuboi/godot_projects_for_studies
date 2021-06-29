extends KinematicBody2D

var npc_name := ""


func _init():
# warning-ignore:return_value_discarded
	Signals.connect("second_changed", self, "_on_second_changed")


func _ready():
	$Name.text = npc_name
	position = Vector2(300, 300)


func _on_second_changed(second: int):
	if second % 5 == 0:
		_move()


func _move():
	var direction = Vector2(randi() % 3 - 1, randi() % 3 - 1) # (-1..1, -1..1)
	position += direction * 50


func set_load_data(data: Dictionary):
	position = data["npc_" + npc_name + "_position"].position


func get_save_data():
	return {
		"npc_" + npc_name + "_position": position,
	}


func show_data():
	prints("npc_" + npc_name + "_position =", position)


func clear_data():
	position = Vector2(300, 300)

extends Node

var time: float = 0.0
var _last_second: float = 1.0


func _physics_process(delta: float):
	time += delta
	if _last_second < time:
		_last_second += 1.0
		Signals.emit_signal("second_changed", int(time))


func set_load_data(data: Dictionary):
	time = data.time


func get_save_data():
	return {
		"time": time
	}


func show_data():
	prints("time =", time)


func clear_data():
	time = 0.0

class_name WorldData
extends Resource

export (Dictionary) var data = {}


func set_data(new_data: Dictionary):
	data = new_data


func _to_string():
	return str(data)

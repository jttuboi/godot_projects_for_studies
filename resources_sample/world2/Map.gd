extends Node2D

const Ze = preload("res://world2/Ze.tscn")

var tiles_floor = [
	[ 0, 0, 1 ],
	[ 0, 0, 1 ],
	[ 0, 0, 1 ],
]

var has_ze = false


func _on_AddRemoveNpc_pressed():
	if has_ze:
		for child in $_.get_children():
			if child.name == "Ze":
				child.queue_free()
				break
		has_ze = false
	else:
		$_.add_child(Ze.instance())
		has_ze = true


func set_load_data(data: Dictionary):
	tiles_floor = data.tiles_floor
	has_ze = data.has_ze
	
	for child in $_.get_children():
		if child.name == "Ze":
			child.queue_free()
			break
	
	if has_ze:
		$_.add_child(Ze.instance())

	for child in $_.get_children():
		child.set_load_data(data)


func get_save_data():
	var data = {
		"tiles_floor": tiles_floor,
		"has_ze": has_ze,
	}
	for child in $_.get_children():
		var child_data: Dictionary = child.get_save_data()
		for key in child_data:
			data[key] = child_data[key]
	return data


func show_data():
	prints("tiles_floor =", tiles_floor)
	prints("has_ze =", has_ze)

	for child in $_.get_children():
		child.show_data()


func clear_data():
	tiles_floor = [
		[ 0, 0, 1 ],
		[ 0, 0, 1 ],
		[ 0, 0, 1 ],
	]

	for child in $_.get_children():
		if child.name == "Ze":
			child.queue_free()
			break
	has_ze = false

	for child in $_.get_children():
		child.clear_data()

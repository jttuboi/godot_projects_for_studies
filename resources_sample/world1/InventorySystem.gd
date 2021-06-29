extends Node

var backpack = {
	id = 0,
	items = [
		{ id = -1, quantity = 0, quality = 1 },
		{ id = -1, quantity = 0, quality = 1 },
		{ id = -1, quantity = 0, quality = 1 },
		{ id = -1, quantity = 0, quality = 1 },
		{ id = -1, quantity = 0, quality = 1 },
	]
}


func _on_ChangeItem_pressed():
	var slot_idx = randi() % 5 # 0..4
	
	var id = randi() % 4 - 1 # -1..2
	var quantity = (randi() % 99 + 1) if (id != -1) else 0 # 1..99
	var quality = (randi() % 5 + 1) if (id != -1) else 1 # 1..4
	
	backpack.items[slot_idx].id = id
	backpack.items[slot_idx].quantity = quantity
	backpack.items[slot_idx].quality = quality


func set_load_data(data: Dictionary):
	backpack = data.backpack


func get_save_data():
	return {
		"backpack": backpack
	}


func show_data():
	prints("backpack =", backpack)


func clear_data():
	backpack = {
	id = 0,
	items = [
		{ id = -1, quantity = 0, quality = 1 },
		{ id = -1, quantity = 0, quality = 1 },
		{ id = -1, quantity = 0, quality = 1 },
		{ id = -1, quantity = 0, quality = 1 },
		{ id = -1, quantity = 0, quality = 1 },
	]
}

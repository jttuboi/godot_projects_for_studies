extends Control

var backpack = {
	items = [
		Item.new(20, 20, 5),
		Item.new(21, 21, 5),
	],
}


func change():
	backpack = {
		items = [
			Item.new(120, 99, 5),
			Item.new(121, 99, 5),
		],
	}


func get_save_data() -> Dictionary:
	return {
		"backpack": backpack,
	}


func set_load_data(data: Dictionary) -> String:
	backpack = data.backpack
	return "backpack loaded"

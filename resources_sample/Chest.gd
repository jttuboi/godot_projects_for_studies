extends Control

var chest = {
	items = [
		Item2.new(10, 10, 5),
		Item2.new(11, 11, 5),
	],
}


func change():
	chest = {
		items = [
			Item2.new(110, 99, 5),
			Item2.new(111, 99, 5),
		],
	}


func get_save_data() -> Dictionary:
	return {
		"chest": chest,
	}


func set_load_data(data: Dictionary) -> String:
	chest = data.chest
	return "chest loaded"


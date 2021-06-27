extends Node2D


var backpack = {
	items = [
		Item.new(15, 98, 4),
		Item.new(13, 43, 1),
		Item.new(21, 23, 5),
		Item.new(14, 9, 2),
	]
}


func _ready():
	# instance new item
	var item = Item.new(14, 99, 5)
	prints(item)
	item.quantity = 95
	prints(item)
	
	# taking item from backpack
	print(backpack)
	backpack.items[0].quantity = 12
	print(backpack)


func _on_Add_pressed():
	print(backpack)
	backpack.items.append(Item.new(3, 3, 3))
	print(backpack)


func _on_Change_pressed():
	print(backpack)
	backpack.items[1] = Item.new(21, 21, 1) 
	print(backpack)


func _on_Save_pressed():
	save_world()


func _on_Load_pressed():
	load_world()


func save_world():
	var file = File.new()
	file.open("user://teste.sav", File.WRITE)

	# data
	var data := {}
	for node in get_tree().get_nodes_in_group("data"):
		if node.has_method("get_save_data"):
			var save_data: Dictionary = node.get_save_data()
			for key in save_data.keys():
				data[key] = save_data[key]
	file.store_var(data)

	file.close()


func load_world():
	var file  = File.new()
	file.open("user://teste.sav", File.READ)

	# data
	var data = file.get_var()
	for node in get_tree().get_nodes_in_group("data"):
		if node.has_method("set_load_data"):
			var situation = node.set_load_data(data)
			print(situation)

	file.close()


func _on_PrintBefore_pressed():
	prints("backpack=", $Backpack.backpack)
	prints("chest=", $Chest.chest)


func _on_PrintAfter_pressed():
	prints("backpack=", $Backpack.backpack)
	prints("chest=", $Chest.chest)

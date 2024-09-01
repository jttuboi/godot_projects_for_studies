extends Panel


func _ready():
	randomize()
# warning-ignore:return_value_discarded
	Signals.connect("data_updated", self, "_on_data_updated")


func _on_Save_pressed():
	_show_data() # mostra dados do jogo antes de salvar
	_save_world() # salva dados do jogo no save file
	_show_file_data() # mostra dados do save file
	_show_data() # mostra dados do jogo


func _on_Load_pressed():
	_show_data() # mostra dados do jogo
	_show_file_data() # mostra dados do save file
	_load_world() # load dados do jogo do save file
	_show_data() # mostra dados do jogo


func _on_Reset_pressed():
	_clear_data() # limpa dados do jogo


func _on_data_updated():
	$Data.text = _str_dict(_get_save_data())


func _save_world():
	var file = File.new()
	file.open("res://save_game/world1.tres", File.WRITE)
	file.store_var(_get_save_data())
	file.close()


func _load_world():
	var file  = File.new()
	file.open("res://save_game/world1.tres", File.READ)
	var save_data = file.get_var()
	file.close()

	for child in get_children():
		if child.has_method("set_load_data"):
			child.set_load_data(save_data)
	Signals.emit_signal("data_updated")


func _get_save_data():
	var save_data := {}
	for child in get_children():
		if child.has_method("get_save_data"):
			var data: Dictionary = child.get_save_data()
			for key in data:
				save_data[key] = data[key]
	return save_data


func _show_data():
	print("==== data")
	print(_str_dict(_get_save_data()))


func _clear_data():
	for child in get_children():
		if child.has_method("clear_data"):
			child.clear_data()
	Signals.emit_signal("data_updated")


func _show_file_data():
	print("==== file data")
	
	var file  = File.new()
	file.open("res://save_game/world1.tres", File.READ)
	var save_data = file.get_var()
	file.close()
	
	print(_str_dict(save_data))


func _str_dict(dict: Dictionary):
	var string = ""
	for key in dict:
		string += key + " = " + str(dict[key]) + "\n"
	return string

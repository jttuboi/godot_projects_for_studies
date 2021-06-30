extends Panel

const LoadButton = preload("res://world3/LoadButton.tscn")


func _on_GenerateSaveGame_pressed():
	if not $WorldName.text.is_valid_filename():
		prints("invalid name -> (", $WorldName.text, ")")
		return

	var directory = Directory.new()
	if not directory.dir_exists("res://save_game/world3/"):
		directory.make_dir("res://save_game/world3/")

	var world_data = WorldData2.new()
	world_data.info_data.version = randi() % 6 + 1
	world_data.info_data.world_name = $WorldName.text

	world_data.data.player_position = Vector2(randi() % 1000, randi() % 1000)

# warning-ignore:return_value_discarded
	ResourceSaver.save("res://save_game/world3/" + $WorldName.text + ".tres", world_data)


func _on_ShowLoads_pressed():
	_clear_load_list()

	var dir = Directory.new()
	if dir.open("res://save_game/world3/") != OK:
		return # error, so, don't do nothing
	dir.list_dir_begin(true, true) # filter to only gets normal files

	var file_name = dir.get_next()
	while not file_name.empty():
		if not file_name.ends_with(".tres"): # only gets .tres save game
			file_name = dir.get_next()
			continue

		var world_data = ResourceLoader.load("res://save_game/world3/" + file_name)

		if not world_data is WorldData2: # only add properly resource
			file_name = dir.get_next()
			continue

		var load_button = LoadButton.instance()
		load_button.set_info(file_name, world_data.info_data.world_name, world_data.info_data.version, world_data.data)
		$LoadList/_/_.add_child(load_button)

		file_name = dir.get_next()


func _on_ClearLoads_pressed():
	_clear_load_list()


func _clear_load_list():
	for child in $LoadList/_/_.get_children():
		child.queue_free()


# https://docs.godotengine.org/en/stable/tutorials/io/background_loading.html
#var loader = ResourceLoader.load_interactive("res://save_game/world3/" + file_name)
#prints("loader:", loader)
#prints("stage:", loader.get_stage())
#prints("stage count:", loader.get_stage_count())
#prints("resource:", loader.get_resource())
#prints("poll error:", loader.poll())
##prints("wait error:", loader.wait())
#prints("_loader:", loader)
#prints("_stage:", loader.get_stage())
#prints("_stage count:", loader.get_stage_count())
#prints("_resource:", loader.get_resource())

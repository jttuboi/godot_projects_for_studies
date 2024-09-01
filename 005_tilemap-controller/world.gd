extends Node2D

var world_name = "pikachu"



func _ready():
	print("World::_ready")
	world_name = Router.get_param("world_name")
	$Blocks.set_dependencies({
		player = $Player
	})
	update()


func _process(_delta: float):
	_update_situation()


func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		if $Ui/WorldMenu.is_visible():
			$Ui/WorldMenu.hide()
		else:
			$Ui/WorldMenu.show()


func _draw():
	var chunk_size = Consts.TILE_SIZE * Consts.CHUNK_SIZE
	for x in range(1, Consts.BLOCKS_WIDTH_SIZE):
		draw_line(Vector2(x * chunk_size, 0), Vector2(x * chunk_size, chunk_size * Consts.BLOCKS_HEIGHT_SIZE), Color.magenta)
	for y in range(1, Consts.BLOCKS_HEIGHT_SIZE):
		draw_line(Vector2(0, y * chunk_size), Vector2(chunk_size * Consts.BLOCKS_WIDTH_SIZE, y * chunk_size), Color.magenta)


func _on_Save_pressed():
	print("World::_on_Save_pressed")
	Data.save_world(self)


func _on_Load_pressed():
	print("World::_on_Load_pressed")
	# clean the previous list if have it
	for item in $Ui/WorldMenu/LoadList/SC/VB.get_children():
		item.queue_free()
	
	var filenames = Data.get_save_filenames()
	for filename in filenames:
		_add_load_item(filename)


func _on_Exit_pressed():
	print("World::_on_Exit_pressed")
	Router.exit_world()


func _update_situation():
	$Ui/Situation.text = ""
	#$Ui/Situation.text += "{0}".format([ _situation ])
	$Ui/Situation.text += "\nchunk_position: {0}".format([ $Blocks._central_chunk ])
	$Ui/Situation.text += "\nplayer_position: {0}".format([ $Player.position.round() ])


func _add_load_item(filename: String):
	var button = Button.new()
	$Ui/WorldMenu/LoadList/SC/VB.add_child(button)
	button.text = filename
	button.connect("pressed", Router, "load_world", [ { "filename": filename } ])

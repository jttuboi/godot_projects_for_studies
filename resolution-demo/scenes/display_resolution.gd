extends Node

# https://www.teoalida.com/database/screenresolution/
# https://www.digitalcitizen.life/what-screen-resolution-or-aspect-ratio-what-do-720p-1080i-1080p-mean
var resolutions = [
	Vector2(1024, 768),
	Vector2(1280, 720),
	Vector2(1280, 800),
	Vector2(1280, 1024),
	Vector2(1366, 768),
	Vector2(1440, 900),
	Vector2(1600, 900),
	Vector2(1920, 1080),
	Vector2(1920, 1200),
	Vector2(1920, 1440),
	Vector2(2048, 1080),
	Vector2(2560, 1080),
	Vector2(2560, 1440),
	Vector2(2560, 1600),
	Vector2(3840, 2160),
	Vector2(7680, 4320)
]



func _ready():
	# add resolutions na combobox
	var id = 0
	for resolution in resolutions:
		$Resolution.add_item(resolution_name(resolution), id)
		
		# disable resolutions unsuported
		if resolution.x > OS.window_size.x or resolution.y > OS.window_size.y:
			$Resolution.set_item_disabled(id, true)
		
		id += 1
	
	# update values
	$Resolution.selected = find_resolution_selected()
	$Fullscreen.pressed = OS.window_fullscreen
	
	update_screen(resolutions[$Resolution.selected])


func resolution_name(resolution):
	return str(resolution.x, "x", resolution.y)


func find_resolution_selected():
	var id = 0
	for resolution in resolutions:
		if resolution.x == OS.window_size.x and resolution.y == OS.window_size.y:
			return id
		id += 1
	return -1


func _on_Resolution_item_selected(ID):
	update_screen(resolutions[ID])


func _on_Fullscreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
	update_screen(resolutions[$Resolution.selected])


func _on_Bordeless_toggled(button_pressed):
	print("NAO IMPLEMENTADO, precisa saber como funciona")
#	OS.window_borderless = button_pressed
#	update_screen(resolutions[$Resolution.selected])


func _on_Resizable_toggled(button_pressed):
	OS.window_resizable = button_pressed
	update_screen(resolutions[$Resolution.selected])


func _on_KeepScreenOn_toggled(button_pressed):
	print("NAO IMPLEMENTADO, precisa saber como funciona")
	#OS.keep_screen_on = button_pressed
	#update_screen(resolutions[$Resolution.selected])


# https://docs.godotengine.org/en/3.1/tutorials/viewports/multiple_resolutions.html
func update_screen(resolution):
	if OS.window_fullscreen:
		OS.window_size = OS.get_real_window_size()
		get_viewport().size = resolution
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, resolution)
	else:
		OS.window_size = resolution
		get_viewport().size = resolution
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, resolution)
	$"../Info".text = Settings.print_settings()

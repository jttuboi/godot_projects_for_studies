extends Node



func _ready():
	settings_default()


func settings_default():
	OS.window_fullscreen = true
	OS.window_resizable = false
	OS.window_borderless = false
	OS.window_position = Vector2(0, 0)
	OS.window_size = OS.get_real_window_size()
	get_viewport().size = OS.get_real_window_size()


func print_settings(title = ""):
	var s = str("====================================\n" if title.empty() else "",
				title if title.empty() else str(title, "\n"),
				"====================================",
				"\nPosition OS: ", OS.window_position,
				"\nResolution OS: ", OS.get_real_window_size().x, "x", OS.get_real_window_size().y,
				"\nResolution: ", OS.window_size.x, "x", OS.window_size.y,
				"\nViewport: ", get_viewport().size.x, "x", get_viewport().size.y,
				"\nBorderless: ", answer(OS.window_borderless),
				"\nFullscreen: ", answer(OS.window_fullscreen),
				"\nResizable: ", answer(OS.window_resizable),
				"\n===================================="
				)
	print(s)
	return s


func answer(boolean):
	return "YES" if boolean else "NO"
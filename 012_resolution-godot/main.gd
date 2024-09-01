extends Control


func _process(delta):
	$ColorRect/RichTextLabel.bbcode_text = "[u]Test: mode = 2D, aspect = KEEP, shrink = 1[/u]"
	$ColorRect/RichTextLabel.bbcode_text += "\n{0}, [color=yellow]OS.get_screen_size()[/color] -> resolution of OS (Windows, Linux, MacOS, ...)".format([ OS.get_screen_size() ])
	$ColorRect/RichTextLabel.bbcode_text += "\n{0}, [color=yellow]OS.get_real_window_size()[/color] -> window size + border of window (purple bar and border)".format([ OS.get_real_window_size() ])
	$ColorRect/RichTextLabel.bbcode_text += "\n{0}, [color=yellow]OS.window_size[/color] -> window size (game screen + black space)".format([ OS.window_size ])
	$ColorRect/RichTextLabel.bbcode_text += "\n{0}, [color=yellow]get_viewport().size[/color] -> game screen (where the game is showed)".format([ get_viewport().size ])
	$ColorRect/RichTextLabel.bbcode_text += "\n({0}, {1}), [color=yellow]ProjectSettings.get_setting('display/window/size/width'), ProjectSettings.get_setting('display/window/size/height')[/color] -> resolution of the game".format([ ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height") ])

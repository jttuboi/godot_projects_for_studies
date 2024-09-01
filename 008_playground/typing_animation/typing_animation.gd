extends Node2D


func _ready():
	$Label.text = "this is a very very veyr long text with lots of letters."
	var text_size_in_pixels = $Label.get_font("font").get_string_size($Label.text).x
	$Animation.playback_speed = 100 / text_size_in_pixels
	$Animation.play("show_typing")
	yield($Animation, "animation_finished")
	
	$Label.text = "this. short."
	text_size_in_pixels = $Label.get_font("font").get_string_size($Label.text).x
	$Animation.playback_speed = 100 / text_size_in_pixels
	$Animation.play("show_typing")

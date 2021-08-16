extends TextureButton

signal was_pressed



func _pressed():
	emit_signal("was_pressed")


func connect_me(obj, unit_name):
	connect("was_pressed", obj, "_on_Button_was_pressed", [self])
	name = unit_name
	$Name.text = unit_name
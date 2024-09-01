extends Node2D

onready var Button = preload("res://src/Button.tscn")

var _selected_units = []
var _buttons = []



func _on_Unit_was_selected(unit):
	if not _selected_units.has(unit):
		_selected_units.append(unit)
	_create_buttons()


func _on_Unit_was_deselected(unit):
	if _selected_units.has(unit):
		_selected_units.erase(unit)
	_create_buttons()


func _on_Button_was_pressed(obj):
	for unit in _selected_units:
		if unit.name == obj.name:
			unit.set_selected(false)


func _create_buttons():
	_delete_buttons()
	for unit in _selected_units:
		if not _buttons.has(unit.name):
			var button = Button.instance()
			button.connect_me(self, unit.name)
			button.rect_position = Vector2(_buttons.size() * 64 + 32, -120)
			$UI/Base.add_child(button)
			_buttons.append(button.name)


func _delete_buttons():
	for button in _buttons:
		if $UI/Base.has_node(button):
			var b = $UI/Base.get_node(button)
			b.queue_free()
			$UI/Base.remove_child(b)
	_buttons.clear()
extends Node

const Character2 = preload("res://src/scenes/my_test/character.tscn")

var _new_character


func _init():
	reset()


func reset():
	_new_character = Character2.instance()


func set_hair_style(hair_style: String):
	_new_character.hair_style = hair_style
	return self


func set_hair_color(hair_color: Color):
	_new_character.hair_color = hair_color
	return self


func set_sex(sex: String):
	_new_character.sex = sex
	return self


func set_body_size(body_size: String):
	_new_character.body_size = body_size
	return self


func set_skin_color(skin_color: Color):
	_new_character.skin_color = skin_color
	return self


func set_items(items: Array):
	for item in items:
		_new_character.items.append(item)
	return self


func build():
	var _character = _new_character
	reset()
	return _character

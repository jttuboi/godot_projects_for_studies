extends Control

const CharacterBuilder = preload("res://src/scripts/my_test/character_builder.gd")
const CharacterBuilder2 = preload("res://src/scripts/my_test/character_builder_2.gd")

var character_builder
var character_builder_2


func _ready():
	character_builder = CharacterBuilder.new()
	character_builder_2 = CharacterBuilder2.new()
	
	_fill_hair_style_option()
	_fill_sex_option()
	_fill_body_size_option()


func _on_GenerateButton_pressed():
	character_builder.set_hair_style(Consts.HAIR_STYLE_TEXT[$GridContainer/HairStyleOption.selected])
	character_builder.set_hair_color($GridContainer/HairColorPicker.color)
	character_builder.set_sex(Consts.SEX_TEXT[$GridContainer/SexOption.selected])
	character_builder.set_body_size(Consts.BODY_SIZE_TEXT[$GridContainer/BodySizeOption.selected])
	character_builder.set_skin_color($GridContainer/SkinColorPicker.color)
	character_builder.set_items(_get_items_selected())
	
	Events.emit_signal("character_created", character_builder.build())
	
#	# OTHER WAY
#
#	var character = character_builder_2.set_hair_style(Consts.HAIR_STYLE_TEXT[$GridContainer/HairStyleOption.selected]) \
#			.set_hair_color($GridContainer/HairColorPicker.color) \
#			.set_sex(Consts.SEX_TEXT[$GridContainer/SexOption.selected]) \
#			.set_body_size(Consts.BODY_SIZE_TEXT[$GridContainer/BodySizeOption.selected]) \
#			.set_skin_color($GridContainer/SkinColorPicker.color) \
#			.set_items(_get_items_selected()) \
#
#	Events.emit_signal("character_created", character.build())


func _fill_hair_style_option():
	for idx in Consts.HAIR_STYLE_TEXT.size():
		$GridContainer/HairStyleOption.add_item(Consts.HAIR_STYLE_TEXT[idx], idx)


func _fill_sex_option():
	for idx in Consts.SEX_TEXT.size():
		$GridContainer/SexOption.add_item(Consts.SEX_TEXT[idx], idx)


func _fill_body_size_option():
	for idx in Consts.BODY_SIZE_TEXT.size():
		$GridContainer/BodySizeOption.add_item(Consts.BODY_SIZE_TEXT[idx], idx)


func _get_items_selected():
	var items = []
	
	for item_node in $GridContainer/Items.get_children():
		# $GridContainer/Items/XXXXX/Checkbox.pressed
		if item_node.get_children()[0].pressed:
			# $GridContainer/Items/XXXXX/Label.text
			items.append(item_node.get_children()[1].text)
	
	return items

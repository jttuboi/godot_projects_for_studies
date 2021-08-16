extends Node2D
class_name Character

var hair_style: String
var hair_color: Color
var sex: String
var body_size: String
var skin_color: Color
var items: Array


func information():
	var text = "NAME: " + name + ", HAIR STYLE: " + hair_style + ", HAIR COLOR: #" + \
		hair_color.to_html(false) + ", SEX: " + sex + ", BODY SIZE: " + \
		body_size + ", SKIN COLOR: #" + skin_color.to_html(false)
	
	if items != null && not items.empty():
		text += ", ITEM(S): "
		for item in items:
			text += item + " "

	return text

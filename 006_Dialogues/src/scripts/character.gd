extends Node2D
class_name Character

export (String) var _id = "character"
export (String) var _name = "Name"
export (Consts.Location) var location = Consts.Location.TOWN


func _process(delta):
	$Id.text = _id
	get_text_location()


func get_text_location():
	match location:
		Consts.Location.HOUSE:
			$Location.text = "House"
		Consts.Location.TOWN:
			$Location.text = "Town"
		Consts.Location.MARKET:
			$Location.text = "Market"

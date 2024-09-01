class_name ChestData
extends Resource


export (Array) var items = [
	ItemData.new(),
	ItemData.new(),
	ItemData.new(),
	ItemData.new(),
	ItemData.new(),
]


func _to_string():
	var string = "["
	for i in items.size():
		string += str(items[i])
		if i != (items.size() - 1):
			string += ","
	return string+"]"

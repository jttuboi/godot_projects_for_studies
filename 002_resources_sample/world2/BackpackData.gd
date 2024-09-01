class_name BackpackData
extends Resource

export (int) var id = 0
export (Array) var items = [
	ItemData.new(),
	ItemData.new(),
	ItemData.new(),
	ItemData.new(),
	ItemData.new(),
]


func _to_string():
	var string = "{id:"+str(id)+", ["
	for i in items.size():
		string += str(items[i])
		if i != (items.size() - 1):
			string += ","
	return string+"]}"

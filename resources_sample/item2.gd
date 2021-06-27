class_name Item2
extends Object

export(int) var id
export(int) var quantity
export(int) var quality


func _init(new_id: int = -1, new_quantity: int = 0, new_quality: int = 1):
	id = new_id
	quantity = new_quantity
	quality = new_quality


func _to_string() -> String:
	return "(id:{0} qnt:{1} qlt:{2})".format([ id, quantity, quality ])

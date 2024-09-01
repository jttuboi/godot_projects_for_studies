extends Timer

var spawn_items = [
	preload("res://scenes/Barrel.tscn"),
	preload("res://scenes/Enemy.tscn"),
	preload("res://scenes/RoadBlock.tscn")
]



func _ready():
	connect("timeout", self, "_on_timeout")



func _on_timeout():
	var r = rand_range(0, spawn_items.size())
	var item = spawn_items[r].instance()
	r = rand_range(0, 500)
	item.position = Vector2(r, -100)
	get_parent().add_child(item)
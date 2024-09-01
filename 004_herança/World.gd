extends Node2D

const SmallBackpack = preload("res://SmallBackpack.tscn")

func _ready():
	var inventory = SmallBackpack.instance() as Inventory
	add_child(inventory)

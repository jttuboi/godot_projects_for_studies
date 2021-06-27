extends TileMap

func _init():
	prints("2.6    ", "init()      ", "Map")
func _ready():
	prints("2.6    ", "ready()     ", "Map")
func _enter_tree():
	prints("2.6    ", "enter_tree()", "Map")
func _exit_tree():
	prints("2.6    ", "exit_tree() ", "Map")

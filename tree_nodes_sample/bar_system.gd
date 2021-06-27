extends CanvasLayer

func _init():
	prints("2.3    ", "init()      ", "BarSystem")
func _ready():
	prints("2.3    ", "ready()     ", "BarSystem")
func _enter_tree():
	prints("2.3    ", "enter_tree()", "BarSystem")
func _exit_tree():
	prints("2.3    ", "exit_tree() ", "BarSystem")

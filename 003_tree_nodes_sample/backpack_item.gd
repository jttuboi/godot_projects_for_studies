extends Control

func _init():
	prints("2.4.1.1", "init()      ", "BackpackItem")
func _ready():
	prints("2.4.1.1", "ready()     ", "BackpackItem")
func _enter_tree():
	prints("2.4.1.1", "enter_tree()", "BackpackItem")
func _exit_tree():
	prints("2.4.1.1", "exit_tree() ", "BackpackItem")

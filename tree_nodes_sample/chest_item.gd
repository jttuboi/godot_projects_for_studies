extends Control

func _init():
	prints("2.4.2.1", "init()      ", "ChestItem")
func _ready():
	prints("2.4.2.1", "ready()     ", "ChestItem")
func _enter_tree():
	prints("2.4.2.1", "enter_tree()", "ChestItem")
func _exit_tree():
	prints("2.4.2.1", "exit_tree() ", "ChestItem")

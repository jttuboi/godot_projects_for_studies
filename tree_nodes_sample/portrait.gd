extends Control

func _init():
	prints("2.3.2.1", "init()      ", "Portrait")
func _ready():
	prints("2.3.2.1", "ready()     ", "Portrait")
func _enter_tree():
	prints("2.3.2.1", "enter_tree()", "Portrait")
func _exit_tree():
	prints("2.3.2.1", "exit_tree() ", "Portrait")

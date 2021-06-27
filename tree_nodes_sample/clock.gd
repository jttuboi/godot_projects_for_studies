extends Control

func _init():
	prints("2.3.1.1", "init()      ", "Clock")
func _ready():
	prints("2.3.1.1", "ready()     ", "Clock")
func _enter_tree():
	prints("2.3.1.1", "enter_tree()", "Clock")
func _exit_tree():
	prints("2.3.1.1", "exit_tree() ", "Clock")

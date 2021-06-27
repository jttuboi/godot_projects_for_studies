extends Node

func _init():
	prints("1.2    ", "init()      ", "Events")
func _ready():
	prints("1.2    ", "ready()     ", "Events")
func _enter_tree():
	prints("1.2    ", "enter_tree()", "Events")
func _exit_tree():
	prints("1.2    ", "exit_tree() ", "Events")

extends Node

func _init():
	prints("1.1    ", "init()      ", "Consts")
func _ready():
	prints("1.1    ", "ready()     ", "Consts")
func _enter_tree():
	prints("1.1    ", "enter_tree()", "Consts")
func _exit_tree():
	prints("1.1    ", "exit_tree() ", "Consts")

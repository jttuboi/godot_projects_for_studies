extends Node

func _init():
	prints("1.4    ", "init()      ", "Inventories")
func _ready():
	prints("1.4    ", "ready()     ", "Inventories")
func _enter_tree():
	prints("1.4    ", "enter_tree()", "Inventories")
func _exit_tree():
	prints("1.4    ", "exit_tree() ", "Inventories")

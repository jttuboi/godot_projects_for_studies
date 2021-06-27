extends Node

func _init():
	prints("1.3    ", "init()      ", "Bars")
func _ready():
	prints("1.3    ", "ready()     ", "Bars")
func _enter_tree():
	prints("1.3    ", "enter_tree()", "Bars")
func _exit_tree():
	prints("1.3    ", "exit_tree() ", "Bars")

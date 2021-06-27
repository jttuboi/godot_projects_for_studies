extends Control

func _init():
	prints("2.3.2  ", "init()      ", "ItemsBar")
func _ready():
	prints("2.3.2  ", "ready()     ", "ItemsBar")
func _enter_tree():
	prints("2.3.2  ", "enter_tree()", "ItemsBar")
func _exit_tree():
	prints("2.3.2  ", "exit_tree() ", "ItemsBar")

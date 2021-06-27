extends Control

func _init():
	prints("2.4.1  ", "init()      ", "Backpack")
func _ready():
	prints("2.4.1  ", "ready()     ", "Backpack")
func _enter_tree():
	prints("2.4.1  ", "enter_tree()", "Backpack")
func _exit_tree():
	prints("2.4.1  ", "exit_tree() ", "Backpack")

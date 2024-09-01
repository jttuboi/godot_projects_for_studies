extends Node

func _init():
	prints("2.1    ", "init()      ", "TimeSystem")
func _ready():
	prints("2.1    ", "ready()     ", "TimeSystem")
func _enter_tree():
	prints("2.1    ", "enter_tree()", "TimeSystem")
func _exit_tree():
	prints("2.1    ", "exit_tree() ", "TimeSystem")

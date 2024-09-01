extends Control

func _init():
	prints("2.3.1  ", "init()      ", "InformationBar")
func _ready():
	prints("2.3.1  ", "ready()     ", "InformationBar")
func _enter_tree():
	prints("2.3.1  ", "enter_tree()", "InformationBar")
func _exit_tree():
	prints("2.3.1  ", "exit_tree() ", "InformationBar")

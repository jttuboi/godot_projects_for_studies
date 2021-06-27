extends Node2D

func _init():
	prints("2.5    ", "init()      ", "Player")
func _ready():
	prints("2.5    ", "ready()     ", "Player")
func _enter_tree():
	prints("2.5    ", "enter_tree()", "Player")
func _exit_tree():
	prints("2.5    ", "exit_tree() ", "Player")
 

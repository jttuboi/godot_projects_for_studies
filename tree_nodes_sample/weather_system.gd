extends Node

func _init():
	prints("2.2    ", "init()      ", "WeatherSystem")
func _ready():
	prints("2.2    ", "ready()     ", "WeatherSystem")
func _enter_tree():
	prints("2.2    ", "enter_tree()", "WeatherSystem")
func _exit_tree():
	prints("2.2    ", "exit_tree() ", "WeatherSystem")

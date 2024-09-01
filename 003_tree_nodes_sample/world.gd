extends Node2D

const SlaughterhouseScene = preload("res://slaughterhouse.tscn")

func _init():
	prints("2      ", "init()      ", "World")
func _ready():
	prints("2      ", "ready()     ", "World")
func _enter_tree():
	prints("2      ", "enter_tree()", "World")
func _exit_tree():
	prints("2      ", "exit_tree() ", "World")


func _on_AddNewScene_pressed():
	var scene = SlaughterhouseScene.instance()
	scene.initialize({})
	add_child(scene)

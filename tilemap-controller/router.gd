extends Node

var _params = null



func new_world(params = null):
	print("Router::new_world")
	_params = params
	get_tree().change_scene("res://world.tscn")


func load_world(params = null):
	print("Router::load_world")
	_params = {
		"world_name": params["filename"].get_basename()
	}
	get_tree().change_scene("res://world.tscn")


func exit_world():
	print("Router::exit_world")
	print("  deve limpar todos os dados ao sair do world")
	get_tree().change_scene("res://main.tscn")


func get_param(key: String):
	if _params != null and _params.has(key):
		return _params[key]
	return null

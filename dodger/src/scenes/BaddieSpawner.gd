extends Node

const Baddie := preload("res://src/scenes/Baddie.tscn")

var parent: Node
var spawn_area: Rect2

var _interval := 0.5 # in seconds
var _current_second := 0.0
var _temporary_second := 0.0
var _pause_creating := false



func _ready():
	Events.connect("player_has_hit", self, "_on_Events_player_has_hit")
	randomize()


func _process(delta: float):
	_current_second += delta
	
	if _current_second > _temporary_second + _interval:
		_temporary_second = _current_second
		
		if not _pause_creating:
			parent.add_child(_create_baddie())


func setup(parent: Node, spawn_area: Rect2):
	self.parent = parent
	self.spawn_area = spawn_area


func restart_spawn():
	_pause_creating = false


func _on_Events_player_has_hit():
	_pause_creating = true


func _create_baddie():
	var baddie = Baddie.instance()
	baddie.position.x = rand_range(spawn_area.position.x, spawn_area.end.x)
	baddie.position.y = rand_range(spawn_area.position.y, spawn_area.end.y)
	return baddie

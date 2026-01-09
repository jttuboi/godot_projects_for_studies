extends Node3D

@export var character: CharacterBody3D
@export var head: Node3D
@export var camera: Camera3D


func _ready() -> void:
	# força o node com script ser o topo da hierarquia,
	# nesse caso estará acima do player
	set_as_top_level(true)


func _physics_process(delta: float) -> void:
	_position(delta)


func _position(_delta: float) -> void:
	global_transform.origin = head.global_transform.origin
	rotation = camera.global_transform.basis.get_euler()

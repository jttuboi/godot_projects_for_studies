@tool
extends MeshInstance3D

@export var _material: StandardMaterial3D


func _ready() -> void:
	if _material:
		_set_emission_color(_material)


func _set_emission_color(material: StandardMaterial3D) -> void:
	$Emission/EmissionA.set_surface_override_material(0, material)
	$Emission/EmissionB.set_surface_override_material(0, material)

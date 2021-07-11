extends Node2D


func _ready():
	$Objects/Tv.rect_position = position


func _on_TvSignal_value_changed(value: float):
	$Objects/Tv/Screen.material.set_shader_param("white_noise_rate", value)

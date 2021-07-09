extends Node2D


func _ready():
	# to interact with shaders, you can use this
	$Sprite.material.set_shader_param("radius", 0.5)
	print($Sprite.material.get_shader_param("radius"))


func _on_HSlider_value_changed(value: float):
	$ApplyBlur/Control/ColorRect.material.set_shader_param("blur_amount", value)


func _on_Basic_ready():
	print("a")
	$ApplyGreyscale/ColorRect.rect_position = position + Vector2(64, 16)
	$ApplyBlur/Control.rect_position = position + Vector2(64, 112)

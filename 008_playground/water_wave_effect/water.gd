tool
extends Sprite


func _on_Water_item_rect_changed():
	_calculate_aspect_ratio()


func _calculate_aspect_ratio():
	material.set_shader_param("aspect_ratio", scale.y / scale.x)

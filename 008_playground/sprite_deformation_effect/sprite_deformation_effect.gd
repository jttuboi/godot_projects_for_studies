extends Node2D

var _duration = 0.2
var _max_click_distance = 1000.0


func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton and event.is_pressed():
		var direction_not_normalized = $Sprite.global_position - get_global_mouse_position()
		_deform(direction_not_normalized)


func _deform(direction_not_normalized: Vector2):
	# value 0.0 .. 1.0 if is near of sprite, the value is high, if is far from sprite, the value is low until be 0
	# this create the strength based on distance between sprite and mouse position
	var deformationStrength = clamp(_max_click_distance - direction_not_normalized.length(), 0, _max_click_distance) / _max_click_distance
	var deformationDirection = direction_not_normalized.normalized()
	# this deformation scale will give to shader of sprite, value between Vector(-0.5, -0.5) to Vector2(0.5, 0.5)
	var deformationScale = 0.5 * deformationDirection * deformationStrength
	
	$Tween.stop_all()
	# this first apply the deformation scale using cubic transition
	$Tween.interpolate_property($Sprite.material, "shader_param/deformation", null, deformationScale, _duration, Tween.TRANS_CUBIC)
	# this second apply the back to normal scale from deformated scale using cubic transition and slow at beginning/end and fast in middle transition
	$Tween.interpolate_property($Sprite.material, "shader_param/deformation", deformationScale, Vector2.ZERO, 1.0, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT, _duration)
	$Tween.start()

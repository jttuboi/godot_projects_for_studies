extends "res://shared/dummy.gd"

var mouse_on_card = false
var mouse_position_for_skew = Vector2.ZERO


func _ready():
	var material = ShaderMaterial.new()
	material.shader = preload("res://perspective_sprite/perspective_sprite_follow_mouse.shader")
	$Sprite.material = material
	
	$Sprite.material.set_shader_param("width", $Sprite.texture.get_width())
	$Sprite.material.set_shader_param("height", $Sprite.texture.get_height())


func _process(delta: float):
	if not mouse_on_card:
		# lerp position to (0, 0) if mouse outside bounds
		mouse_position_for_skew = mouse_position_for_skew.linear_interpolate(Vector2.ZERO, 5 * delta)

	$Sprite.material.set_shader_param("mouse_position", mouse_position_for_skew)


func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		var actual_rect = Rect2(-$Sprite.texture.get_width(), -$Sprite.texture.get_height(), 
		$Sprite.texture.get_width() * 2.0, $Sprite.texture.get_height() * 2.0)
		print(actual_rect)
		print(to_local(event.position))
		if actual_rect.has_point(to_local(event.position)):
			mouse_on_card = true

			mouse_position_for_skew = to_local(event.position)
		else:
			# if on previous motion mouse was on card and on this frame mouse is moved out - reset flag
			if mouse_on_card:
				mouse_on_card = false

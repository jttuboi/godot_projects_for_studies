extends Node2D

const DURATION = 2
func _ready():
	randomize()
	# randomize some values for open simplex noise
	($Dummy.material as ShaderMaterial).get_shader_param("dissolve_texture").noise.period = rand_range(60.0, 130.0) # 0.1 .. 256
	($Dummy.material as ShaderMaterial).get_shader_param("dissolve_texture").noise.persistence = rand_range(0.2, 0.8) # 0..1
	($Dummy.material as ShaderMaterial).get_shader_param("dissolve_texture").noise.lacunarity = rand_range(1.8, 3.2) # 0..4
	
	# apply animation of dissolution
	$Tween.interpolate_property($Dummy.material, "shader_param/dissolve_value", 1.0, 0.0, DURATION, Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()

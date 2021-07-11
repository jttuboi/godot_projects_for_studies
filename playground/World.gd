extends Node

# recommendation
# https://thebookofshaders.com/

# no license
# https://kidscancode.org/godot_recipes/shaders/
func _on_Basic_pressed():
	_clear_container()
	var scene = preload("res://basic/basic.tscn").instance()
	_add_container(scene)


# no license
# https://docs.godotengine.org/en/stable/tutorials/shading/your_first_shader/index.html
func _on_Basic2_pressed():
	_clear_container()
	var scene = preload("res://basic2/basic2.tscn").instance()
	_add_container(scene)


# no license
# https://www.youtube.com/watch?v=D7XSL0zBOwI
func _on_ExplosionEffect_pressed():
	_clear_container()
	var scene = preload("res://explosion_effect/particles.tscn").instance()
	scene.initialize(preload("res://shared/dummy.png"))
	_add_container(scene)


# no license
# https://www.youtube.com/watch?v=D7XSL0zBOwI
func _on_HeartExplosionEffect_pressed():
	_clear_container()
	var scene = preload("res://explosion_effect/particles.tscn").instance()
	scene.initialize(preload("res://shared/godot.png"))
	scene.set_heart_particle()
	_add_container(scene)


# no license
# https://www.youtube.com/watch?v=53rDu0rMoss
func _on_CreationByParticlesEffect_pressed():
	_clear_container()
	var scene = preload("res://creation_by_particles_effect/particles.tscn").instance()
	_add_container(scene)


# no license
# https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashAnimationEffect_pressed():
	_clear_container()
	var scene = preload("res://flash_effect/dummy.tscn").instance()
	_add_container(scene)
	scene.initialize_by_animation()


# no license
# https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashTweenEffect_pressed(): # this use the easiest way to do flash effect than using animation
	_clear_container()
	var scene = preload("res://flash_effect/dummy.tscn").instance()
	_add_container(scene)
	scene.initialize_by_tween()


# no license
# https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashTweenEffect2_pressed():
	_clear_container()
	var scene = preload("res://flash_effect/dummy.tscn").instance()
	_add_container(scene)
	scene.initialize_by_tween_in_out()


# no license
# https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_WalkingFootstepAnimation_pressed():
	_clear_container()
	var scene = preload("res://walking_footstep_animation/walking_duck.tscn").instance()
	_add_container(scene)


# no license
# https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_TypingAnimation_pressed():
	_clear_container()
	var scene = preload("res://typing_animation/typing_animation.tscn").instance()
	_add_container(scene)


# no license
# https://www.youtube.com/watch?v=BZp8DwPdj4s
func _on_SpriteDeformationEffect_pressed():
	_clear_container()
	var scene = preload("res://sprite_deformation_effect/sprite_deformation_effect.tscn").instance()
	_add_container(scene)


# cc0 license
# https://godotshaders.com/shader/simple-2d-dissolve/
# https://www.youtube.com/watch?v=vz5VkRyDH54
func _on_DissolveEffect_pressed():
	_clear_container()
	var scene = preload("res://dissolve_effect/dissolve_effect.tscn").instance()
	_add_container(scene)


# no license
# https://www.youtube.com/watch?v=eT9ztkG2PTU
func _on_LaserEffect_pressed():
	_clear_container()
	var scene = preload("res://laser_effect/laser_effect.tscn").instance()
	_add_container(scene)


# CC0 license
# https://godotshaders.com/shader/2d-fog-overlay/
# uses fractal brownian motion
func _on_FogEffect_pressed():
	_clear_container()
	var scene = preload("res://fog_effect/fog_effect.tscn").instance()
	_add_container(scene)


# MIT license
# https://godotshaders.com/shader/sprite-perspective-correection/
# no license
# https://github.com/Larrxi/godot-shader-skew-text
func _on_PerspectiveSprite_pressed():
	_clear_container()
	var scene = preload("res://perspective_sprite/perspective_sprite.tscn").instance()
	_add_container(scene)


# CC0 license
# https://godotshaders.com/shader/retro-tv-shader/
func _on_RetroTvEffect_pressed():
	_clear_container()
	var scene = preload("res://retro_tv_effect/retro_tv_effect.tscn").instance()
	_add_container(scene)


# MIT license
# https://godotshaders.com/shader/crt-shader/
# https://bitbucket.org/arlez80/godot-crt/src/master/
func _on_RetroTvEffect2_pressed():
	_clear_container()
	var scene = preload("res://retro_tv_effect_2/retro_tv_effect_2.tscn").instance()
	_add_container(scene)


# CC0 license
# https://godotshaders.com/shader/simple-circle-transition-2/
func _on_CircleTransitionScreen_pressed():
	_clear_container()
	var scene = preload("res://circle_transition_screen/circle_transition_screen.tscn").instance()
	_add_container(scene)
	scene.initialize_circle()


# CC0 licence
# https://godotshaders.com/shader/simple-circle-transition/
func _on_OvalTransitionScreen_pressed():
	_clear_container()
	var scene = preload("res://circle_transition_screen/circle_transition_screen.tscn").instance()
	_add_container(scene)
	scene.initialize_oval()


# no licence
# https://www.youtube.com/watch?v=UI9JP5TNZ94
func _on_FlameEffect_pressed():
	_clear_container()
	var scene = preload("res://flame_effect/flame_effect.tscn").instance()
	_add_container(scene)


# MIT licence
# https://www.youtube.com/playlist?list=PLhqJJNjsQ7KHqNMYmTwtsYTeTrqrRP_fP
func _on_WaterWaveEffect_pressed():
	_clear_container()
	var scene = preload("res://water_wave_effect/water_wave_effect.tscn").instance()
	_add_container(scene)


func _add_container(node):
	node.position = $ContainerCenter.position
	$Container.add_child(node)


func _clear_container():
	for node in $Container.get_children():
		$Container.remove_child(node)
		node.queue_free()

extends Node


## https://kidscancode.org/godot_recipes/shaders/
func _on_Basic_pressed():
	_clear_container()
	var scene = preload("res://basic/basic.tscn").instance()
	_add_container(scene)


## https://www.youtube.com/watch?v=D7XSL0zBOwI
func _on_ExplosionEffect_pressed():
	_clear_container()
	var scene = preload("res://explosion_effect/particles.tscn").instance()
	scene.initialize(preload("res://shared/dummy.png"))
	_add_container(scene)


## https://www.youtube.com/watch?v=D7XSL0zBOwI
func _on_HeartExplosionEffect_pressed():
	_clear_container()
	var scene = preload("res://explosion_effect/particles.tscn").instance()
	scene.initialize(preload("res://shared/godot.png"))
	scene.set_heart_particle()
	_add_container(scene)


## https://www.youtube.com/watch?v=53rDu0rMoss
func _on_CreationByParticlesEffect_pressed():
	_clear_container()
	var scene = preload("res://creation_by_particles_effect/particles.tscn").instance()
	_add_container(scene)


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashAnimationEffect_pressed():
	_clear_container()
	var scene = preload("res://flash_effect/dummy.tscn").instance()
	_add_container(scene)
	scene.initialize_by_animation()


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashTweenEffect_pressed(): # this use the easiest way to do flash effect than using animation
	_clear_container()
	var scene = preload("res://flash_effect/dummy.tscn").instance()
	_add_container(scene)
	scene.initialize_by_tween()


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashTweenEffect2_pressed():
	_clear_container()
	var scene = preload("res://flash_effect/dummy.tscn").instance()
	_add_container(scene)
	scene.initialize_by_tween_in_out()


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_WalkingFootstepAnimation_pressed():
	_clear_container()
	var scene = preload("res://walking_footstep_animation/walking_duck.tscn").instance()
	_add_container(scene)


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_TypingAnimation_pressed():
	_clear_container()
	var scene = preload("res://typing_animation/typing_animation.tscn").instance()
	_add_container(scene)


# https://www.youtube.com/watch?v=BZp8DwPdj4s
func _on_SpriteDeformationEffect_pressed():
	_clear_container()
	var scene = preload("res://sprite_deformation_effect/sprite_deformation_effect.tscn").instance()
	_add_container(scene)


# https://www.youtube.com/watch?v=eT9ztkG2PTU
func _on_LaserEffect_pressed():
	_clear_container()
	var scene = preload("res://laser_effect/laser_effect.tscn").instance()
	_add_container(scene)


func _add_container(node):
	node.position = $ContainerCenter.position
	$Container.add_child(node)


func _clear_container():
	for node in $Container.get_children():
		$Container.remove_child(node)
		node.queue_free()

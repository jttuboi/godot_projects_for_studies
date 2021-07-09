extends Node


## https://kidscancode.org/godot_recipes/shaders/
func _on_Basic_pressed():
	_clear_container()
	var scene = preload("res://basic/basic.tscn").instance()
	_add_container(scene)


## https://www.youtube.com/watch?v=D7XSL0zBOwI
func _on_ExplosionEffect_pressed():
	_clear_container()
	var DummyTexture = preload("res://shared/dummy.png")
	var ParticlesScene = preload("res://explosion_effect/particles.tscn")
	var particles = ParticlesScene.instance()
	particles.initialize(DummyTexture)
	_add_container(ParticlesScene.instance())


## https://www.youtube.com/watch?v=D7XSL0zBOwI
func _on_HeartExplosionEffect_pressed():
	_clear_container()
	var GodotTexture = preload("res://shared/godot.png")
	var ParticlesScene = preload("res://explosion_effect/particles.tscn")
	var particles = ParticlesScene.instance()
	particles.initialize(GodotTexture)
	particles.set_heart_particle()
	_add_container(particles)


## https://www.youtube.com/watch?v=53rDu0rMoss
func _on_CreationByParticlesEffect_pressed():
	_clear_container()
	var ParticlesScene = preload("res://creation_by_particles_effect/particles.tscn")
	var particles = ParticlesScene.instance()
	_add_container(particles)


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashAnimationEffect_pressed():
	_clear_container()
	var DummyScene = preload("res://flash_effect/dummy.tscn")
	var dummy = DummyScene.instance()
	_add_container(dummy)
	dummy.initialize_by_animation()


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashTweenEffect_pressed(): # this use the easiest way to do flash effect than using animation
	_clear_container()
	var DummyScene = preload("res://flash_effect/dummy.tscn")
	var dummy = DummyScene.instance()
	_add_container(dummy)
	dummy.initialize_by_tween()


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_FlashTweenEffect2_pressed():
	_clear_container()
	var DummyScene = preload("res://flash_effect/dummy.tscn")
	var dummy = DummyScene.instance()
	_add_container(dummy)
	dummy.initialize_by_tween_in_out()


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_WalkingFootstepAnimation_pressed():
	_clear_container()
	var WalkingDuckScene = preload("res://walking_footstep_animation/walking_duck.tscn")
	var walking_duck_scene = WalkingDuckScene.instance()
	_add_container(walking_duck_scene)


## https://www.youtube.com/watch?v=iFJtXrwacY0
func _on_TypingAnimation_pressed():
	_clear_container()
	var TypingAnimationScene = preload("res://typing_animation/typing_animation.tscn")
	var typing_animation = TypingAnimationScene.instance()
	_add_container(typing_animation)


# https://www.youtube.com/watch?v=BZp8DwPdj4s
func _on_SpriteDeformationEffect_pressed():
	_clear_container()
	var SpriteDeformationEffectScene = preload("res://sprite_deformation_effect/sprite_deformation_effect.tscn")
	var sprite_deformation_effect = SpriteDeformationEffectScene.instance()
	_add_container(sprite_deformation_effect)


# https://www.youtube.com/watch?v=eT9ztkG2PTU
func _on_LaserEffect_pressed():
	_clear_container()
	var LaserEffectScene = preload("res://laser_effect/laser_effect.tscn")
	var laser_effect = LaserEffectScene.instance()
	_add_container(laser_effect)


func _add_container(node):
	node.position = $ContainerCenter.position
	$Container.add_child(node)


func _clear_container():
	for node in $Container.get_children():
		$Container.remove_child(node)
		node.queue_free()

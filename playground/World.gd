extends Node


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


func _add_container(node):
	node.position = $ContainerCenter.position
	$Container.add_child(node)


func _clear_container():
	for node in $Container.get_children():
		$Container.remove_child(node)
		node.queue_free()

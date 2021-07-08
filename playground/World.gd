extends Node


## https://www.youtube.com/watch?v=D7XSL0zBOwI
func _on_ExplosionEffect_pressed():
	clear_container()
	var DummyTexture = preload("res://shared/dummy.png")
	var ParticlesScene = preload("res://explosion_effect/particles.tscn")
	var particles = ParticlesScene.instance()
	particles.initialize(DummyTexture)
	add_container(ParticlesScene.instance())


func _on_HeartExplosionEffect_pressed():
	clear_container()
	var GodotTexture = preload("res://shared/godot.png")
	var ParticlesScene = preload("res://explosion_effect/particles.tscn")
	var particles = ParticlesScene.instance()
	particles.initialize(GodotTexture)
	particles.set_heart_particle()
	add_container(particles)


func add_container(node):
	node.position = $ContainerCenter.position
	$Container.add_child(node)


func clear_container():
	for node in $Container.get_children():
		$Container.remove_child(node)
		node.queue_free()

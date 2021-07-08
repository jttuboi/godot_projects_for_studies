extends Node


func _ready():
	pass


func _on_ExplosionEffect_pressed():
	clear_container()


func clear_container():
	for node in $Container.get_children():
		$Container.remove_child(node)
		node.queue_free()

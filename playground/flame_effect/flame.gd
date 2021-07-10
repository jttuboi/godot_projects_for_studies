extends Particles2D


func _physics_process(_delta: float):
	global_position = get_global_mouse_position()

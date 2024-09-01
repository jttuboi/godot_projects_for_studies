extends Camera2D

var magnitude = 0
var timeleft = 0
var is_shaking = false


func _ready():
	pass


func shake(new_magnitude, lifetime):
	if (magnitude > new_magnitude):
		return
	
	magnitude = new_magnitude
	timeleft = lifetime
	
	if (is_shaking):
		return
	is_shaking = true
	
	while (timeleft > 0):
		position = random_position()
		
		# ??
		timeleft -= get_process_delta_time()
		yield(get_tree(), "idle_frame")
	
	is_shaking = false
	magnitude = 0
	position = Vector2.ZERO


func random_position():
	var pos = Vector2.ZERO
	pos.x = rand_range(-magnitude, magnitude)
	pos.y = rand_range(-magnitude, magnitude)
	return pos
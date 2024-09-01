extends Sprite

func _ready():
	randomize()
	rotation_degrees = rand_range(0, 360)
	
	$Smoke.emitting = true
	$Flare.emitting = true
	
	Utils.remote_call("Camera", "shake", 8, 0.2)
	$Hit.play()
	
	$Animation.play("fade_out")
	yield($Animation, "animation_finished")
	queue_free()
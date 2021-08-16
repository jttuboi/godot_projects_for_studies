extends Sprite

func _ready():
	$Animation.play("fade_out")
	yield($Animation, "animation_finished")
	queue_free()

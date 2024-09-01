extends Area2D

var velocity = Vector2(0, 200)



func _process(delta):
	translate(velocity * delta)
	
	if (position.y >= Utils.height_screen + 7):
		queue_free()
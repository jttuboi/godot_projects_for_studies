extends Area2D

var damage
var velocity = Vector2.ZERO



func _physics_process(delta):
	position += velocity * delta



func start_at(direction, speed, location):
	rotation = direction
	position = location
	velocity = Vector2(speed, 0).rotated(direction)



func properties(dmg, lifetime):
	damage = dmg
	$Lifetime.wait_time = lifetime



func _on_Lifetime_timeout():
	queue_free()
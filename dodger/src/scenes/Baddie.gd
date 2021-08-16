extends Area2D

const DEADLINE_POSITION = 500
const MIN_VELOCITY = 100
const MAX_VELOCITY = 200
const MIN_SCALE = 0.5
const MAX_SCALE = 3.0

var _velocity := 100



func _ready():
	randomize()
	
	_velocity = rand_range(MIN_VELOCITY, MAX_VELOCITY)
	
	var scale2 := rand_range(MIN_SCALE, MAX_SCALE)
	scale = Vector2(scale2, scale2)


func _process(delta: float):
	position.y += _velocity * delta
	
	if _is_end_of_line():
		Events.emit_signal("player_has_dodged")
		queue_free()


func _is_end_of_line():
	return position.y  > DEADLINE_POSITION


func _on_Baddie_area_entered(area):
	if area.is_in_group("player"):
		queue_free()

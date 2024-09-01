extends KinematicBody2D

var moveSpeed = 20.0

const FootprintScene = preload("res://walking_footstep_animation/footprint.tscn")


func _ready():
	$Camera.current = true


func _physics_process(_delta: float):
# warning-ignore:return_value_discarded
	move_and_slide(Vector2.DOWN * moveSpeed, Vector2.UP)


func footstep(left_step: bool):
	var footprint = FootprintScene.instance()
	footprint.position = position
	footprint.position.y += 16
	if left_step:
		footprint.position.x -= 4
	else:
		footprint.position.x += 5

	get_parent().add_child(footprint)

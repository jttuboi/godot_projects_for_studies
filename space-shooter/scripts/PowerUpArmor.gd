extends "res://scripts/PowerUp.gd"



func _ready():
	connect("area_entered", self, "_on_Area_entered")


func _on_Area_entered(body):
	if (body.is_in_group("ship")):
		$Hit.play()
		body.armor += 1
		queue_free()
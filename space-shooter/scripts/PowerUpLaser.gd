extends "res://scripts/PowerUp.gd"



func _ready():
	connect("area_entered", self, "_on_Area_entered")


func _on_Area_entered(body):
	
	if (body.is_in_group("ship")):
		body.is_double_shooting = true
		
		# o som nao funciona porque o pai PoewerUpLaser eh destruido tao rapido que nao da tempo de fazer o som
		# para corrigir isso ele precisaria estar em outro lugar controlando os sons
		$Hit.play()
		queue_free()
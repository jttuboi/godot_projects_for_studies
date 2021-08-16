extends "res://scripts/Laser.gd"



func _ready():
	connect("area_entered", self, "_on_Area_entered")
	
	# quando o tiro sai ele faz o som, ou seja, quando inicia a scene do Laser
	$Hit.play()

func _on_Area_entered(body):
	# se o laser atinge o ship, ele atualiza os dados do ship e 
	# cria os eventos do laser e camera
	if (body.is_in_group("ship")):
		body.armor -= 1
		create_flare()
		Utils.remote_call("Camera", "shake", 3, 0.13)
		queue_free()
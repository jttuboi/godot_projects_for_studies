extends Node2D

const PowerUps = [
	preload("res://scenes/PowerUpArmor.tscn"),
	preload("res://scenes/PowerUpLaser.tscn")
]



func _ready():
	#yield(Utils.create_timer(rand_range(10, 15)), "timeout")
	spawn()


func spawn():
	while (true):
		randomize()
		
		var powerup = Utils.choose(PowerUps).instance()
		powerup.position = new_position()
		$Container.add_child(powerup)
		
		# apos o timer dentro do create_timer mandar uma signal timeout, 
		# ele continua saindo do loop e finalizando a execucao do spawn()
		yield(Utils.create_timer(rand_range(1, 1)), "timeout")


func new_position():
	var new_position = Vector2.ZERO
	new_position.x = rand_range(0 + 7, Utils.width_screen - 7)
	new_position.y = 0 - 7
	return new_position
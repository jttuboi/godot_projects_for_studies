extends Node2D

const Enemies = [
	preload("res://scenes/EnemyKamikaze.tscn"),
	preload("res://scenes/EnemyClever.tscn")
]



func _ready():
	spawn()


func spawn():
	while (true):
		randomize()
		
		var enemy = Utils.choose(Enemies).instance()
		enemy.position = new_position()
		$Container.add_child(enemy)
		
		# apos o timer dentro do create_timer mandar uma signal timeout, 
		# ele continua saindo do loop e finalizando a execucao do spawn()
		yield(Utils.create_timer(rand_range(0.5, 1.25)), "timeout")


func new_position():
	var new_position = Vector2.ZERO
	new_position.x = rand_range(0 + 16, Utils.width_screen - 16)
	new_position.y = 0 - 16
	return new_position
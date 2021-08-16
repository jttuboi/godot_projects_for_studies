extends "res://scripts/Enemy.gd"

const LaserEnemy = preload("res://scenes/LaserEnemy.tscn")



func _ready():
	# escolhe uma direcao inicial, se vai pra esquerda ou para a direita
	velocity.x = Utils.choose([velocity.x, -velocity.x])

	yield(Utils.create_timer(1), "timeout")
	shoot()

func _process(delta):
	# altera a direcao para o oposto quando ele bate na parede
	if (position.x <= 0 + 16):
		velocity.x = abs(velocity.x)
	if (position.x >= Utils.width_screen - 16):
		velocity.x = -abs(velocity.x)


func shoot():
	while (true):
		var laser = LaserEnemy.instance()
		laser.position = $Cannon.global_position
		Utils.main_node.add_child(laser)
		
		# apos o create_timer mandar uma signal timeout, 
		# ele para de atirar
		yield(Utils.create_timer(1.5), "timeout")
extends Area2D

const Laser = preload("res://scenes/LaserShip.tscn")
const Explosion = preload("res://scenes/Explosion.tscn")
const Flash = preload("res://scenes/Flash.tscn")

signal armor_changed(armor)

var armor = 4 setget set_armor
var is_double_shooting = false setget set_double_shooting


func _ready():
	add_to_group("ship")
	yield(Utils.create_timer(0.5), "timeout")
	shoot()


func _process(delta):
	translate_with_motion()


### funcao antiga para comparacao
#func translate_following_mouse():
#	# ele seta diretamente a posicao do mouse, ou seja, ele pode ser teleportado de um lado pro outro
#	# sem o efeito de movimento da nave
#	position.x = Utils.mouse_position.x


func translate_with_motion():
	# eh a distancia entre o mouse e a nave.
	# o nro eh a porcentagem da distancia entre eles, nesse caso eh 20% da distancia entre eles
	# para a nave percorrer
	var motion = (Utils.mouse_position.x - position.x) * 0.2
	translate(Vector2(motion, 0))
	
	# evita a nave sair da tela, para isso limita a posicao X ser entre 16 (metade do tamanho da imagem da nave)
	# e width - 16 (tamanho da tela menos tamanho da nave)
	position.x = clamp(position.x, 0 + 16, Utils.width_screen - 16)


func shoot():
	while (true):
		var position_left = $Cannons/Left.global_position
		var position_right = $Cannons/Right.global_position
		create_laser(position_left)
		create_laser(position_right)
		
		if (is_double_shooting):
			var laser_left = create_laser(position_left)
			var laser_right = create_laser(position_right)
			laser_left.velocity.x = -25
			laser_right.velocity.x = 25
		
		yield(Utils.create_timer(0.25), "timeout")


func create_laser(position_cannon):
	var laser = Laser.instance()
	laser.position = position_cannon
	Utils.main_node.add_child(laser)
	return laser


func create_explosion():
	var explosion = Explosion.instance()
	explosion.position = position
	Utils.main_node.add_child(explosion)


func set_armor(new_armor):
	# previne ganhar mais vida q 4
	if (new_armor > 4):
		return
	
	# caso ele recebeu dano, entao aparece um flash vermelho e faz o som de atingido
	if (new_armor < armor):
		$Hit.play()
		Utils.main_node.add_child(Flash.instance())
	
	armor = new_armor
	emit_signal("armor_changed", armor)
	
	# se nao tem mais armor, entao ele ira destruir a ship
	if (armor <= 0):
		create_explosion()
		queue_free()

func set_double_shooting(double_shooting):
	is_double_shooting = double_shooting
	
	if (is_double_shooting):
		# permite usar o double shooting por 5 segundos 
		yield(Utils.create_timer(5), "timeout")
		is_double_shooting = false
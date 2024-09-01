extends Sprite

export var velocity = Vector2.ZERO

var reset_position = Vector2(0, -180)



func _process(delta):
	translate(velocity * delta)
	
	# quando a imagem sai da tela, ele joga ele para cima para reiniciar o "loop" do plano de fundo
	if (position.y >= Utils.height_screen):
		position = reset_position
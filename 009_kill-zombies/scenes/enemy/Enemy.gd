extends RigidBody2D

var speed = 0
var velocity = Vector2.ZERO



func _physics_process(delta):
	var Player = get_tree().get_current_scene().get_node("Player")

	look_at(Player.position)
	
	velocity = (Player.position - position).normalized()
	position = position + velocity * speed * delta



func start_at(location, speed):
	position = location
	self.speed = speed
	print(get_tree().get_current_scene().name)
	#self.connect("body_entered", get_tree().get_current_scene(), "_on_Enemy_body_entered")
	##
	#
	#
	##
	#
	#
	#ver como ativar a colisao de uma area2d com o corpo do inimigo
	#utlizar o signal se possivel
	# o tiro deve ser reconhecido dentro do inimigo, jah que ele eh o receptor do contato
	# o body q eh o tiro eh deletado apos encostar no inimigo
	# o inimigo tbm deve ser deletado
	# deve ser incrementado o zumbi kill
	#
	#
	
	#
	#

func _on_Enemy_body_entered(body):
	print("_on_Enemy_body_entered")


func _on_Enemy_mouse_entered():
	print("_on_Enemy_mouse_entered")

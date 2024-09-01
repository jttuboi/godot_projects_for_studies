extends Area2D

export var armor = 2 setget set_armor
export var velocity = Vector2.ZERO

const Explosion = preload("res://scenes/Explosion.tscn")



func _ready():
	add_to_group("enemies")
	connect("area_entered", self, "_on_Area_entered")


func _process(delta):
	translate(velocity * delta)
	dispose_enemy_when_leave_screen()


func _on_Area_entered(body):
	if (body.is_in_group("ship")):
		body.armor -= 1
		create_explosion()
		queue_free()


func dispose_enemy_when_leave_screen():
	if (position.y >= Utils.height_screen + 16):
		queue_free()


func set_armor(new_armor):
	if (is_queued_for_deletion()):
		return
	
	# ativa o som de atingido quando receber dano
	if (new_armor < armor):
		$Hit.play()
		
	armor = new_armor
	
	# se nao tem mais armor, entao ele ira destruir o enemy
	if (armor <= 0):
		Utils.main_node.find_node("Score").score += 5
		create_explosion()
		queue_free()


func create_explosion():
	var explosion = Explosion.instance()
	explosion.position = position
	Utils.main_node.add_child(explosion)
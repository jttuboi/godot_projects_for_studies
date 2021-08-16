extends Node2D

export (PackedScene) var Enemy
var delay = 2
var timer = 0



func _process(delta):
	timer += delta
	if (timer >= delay):
		timer = 0
		create_enemy()



func create_enemy():
	var e = Enemy.instance()
	$"../Enemies".add_child(e)
	e.start_at(new_enemy_location(), new_enemy_speed())



func new_enemy_location():
	var pos_x = 0
	var latitude = randi() % 2
	match (latitude):
		0: # up
			pos_x = rand_range(-60, -50)
		1: # bottom
			pos_x = rand_range(500, 510)
	
	var pos_y = 0
	var longitude = randi() % 2
	match (longitude):
		0: # left
			pos_y = rand_range(-60, -50)
		1: # right
			pos_y = rand_range(850, 860)
	
	return Vector2(pos_x, pos_y)



func new_enemy_speed():
	return randi() % 51 + 50
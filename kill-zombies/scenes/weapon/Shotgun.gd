extends Node2D

signal empty_ammo

var Bullet = preload("res://scenes/weapon/Bullet.tscn")

const _PI = PI
const _PI_9 = PI / 9
const _PI_6 = PI / 6
const _2_PI_9 = 2 * PI / 9
const _PI_3 = PI / 3
const MAX_AMMO = 8

var loading = 0.5
var ammo = MAX_AMMO



func create_shoots(direction, location):
	var shoots = []
	
	var quantity_of_shoots = randi() % 3 + 3 # 3 .. 5
	
	match (quantity_of_shoots):
		3:
			shoots.append(create_shoot(direction, location, -_2_PI_9))
			shoots.append(create_shoot(direction, location))
			shoots.append(create_shoot(direction, location, _2_PI_9))
		4:
			shoots.append(create_shoot(direction, location, -_PI_3))
			shoots.append(create_shoot(direction, location, -_PI_9))
			shoots.append(create_shoot(direction, location, _PI_9))
			shoots.append(create_shoot(direction, location, _PI_3))
		5:
			shoots.append(create_shoot(direction, location, -_PI_3))
			shoots.append(create_shoot(direction, location, -_PI_6))
			shoots.append(create_shoot(direction, location))
			shoots.append(create_shoot(direction, location, _PI_6))
			shoots.append(create_shoot(direction, location, _PI_3))
		_:
			shoots.append(create_shoot(direction, location))
	
	ammo -= 1
	if (ammo <= 0):
		emit_signal("empty_ammo")
	
	return shoots



func create_shoot(direction, location, variation_of_direction = 0):
	var new_direction = change_direction(direction, variation_of_direction)
	
	var s = Bullet.instance()
	s.start_at(new_direction, bullet_speed(), location)
	s.properties(bullet_damage(), bullet_lifetime())
	
	return s



func change_direction(direction, add_angle_in_radian):
	var sum = direction + add_angle_in_radian
	
	if (sum > _PI):
		return _PI
	elif (sum < -_PI):
		return -_PI
	return sum



func bullet_damage():
	return randi() % 6 + 70 # 70 .. 75



func bullet_lifetime():
	return float(randi() % 6 + 10) / 100 # 0.1 .. 0.15



func bullet_speed():
	return randi() % 101 + 900 # 900 .. 1000
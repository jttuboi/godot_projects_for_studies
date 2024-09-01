extends Node2D

signal empty_ammo

var Bullet = preload("res://scenes/weapon/Bullet.tscn")

const MAX_AMMO = 20

var loading = 0.1
var ammo = MAX_AMMO



func create_shoots(direction, location):
	var shoots = []
	
	var s = Bullet.instance()
	s.start_at(direction, bullet_speed(), location)
	s.properties(bullet_damage(), bullet_lifetime())
	shoots.append(s)
	
	ammo -= 1
	if (ammo <= 0):
		emit_signal("empty_ammo")
	
	return shoots



func bullet_damage():
	return randi() % 6 + 50 # 50 .. 55



func bullet_lifetime():
	return float(randi() % 21 + 50) / 100 # 0.5 .. 0.7



func bullet_speed():
	return randi() % 101 + 1350 # 1350 .. 1450
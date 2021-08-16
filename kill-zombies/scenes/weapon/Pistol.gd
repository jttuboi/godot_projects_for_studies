extends Node2D

var Bullet = preload("res://scenes/weapon/Bullet.tscn")

var loading = 0.2
var ammo = 0



func create_shoots(direction, location):
	var shoots = []
	
	var s = Bullet.instance()
	s.start_at(direction, bullet_speed(), location)
	s.properties(bullet_damage(), bullet_lifetime())
	shoots.append(s)
	
	return shoots



func bullet_damage():
	return randi() % 11 + 30 # 30 .. 40



func bullet_lifetime():
	return float(randi() % 11 + 35) / 100 # 0.35 .. 0.45



func bullet_speed():
	return randi() % 101 + 850 # 850 .. 950
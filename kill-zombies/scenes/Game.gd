extends Node2D

var Pistol = load("res://scenes/weapon/Pistol.tscn")
var Shotgun = load("res://scenes/weapon/Shotgun.tscn")
var Rifle = load("res://scenes/weapon/Rifle.tscn")

var Weapon



func _init():
	randomize()
	Weapon = Pistol.instance()



func _process(delta):
	$Screen/Life.text = "life " + str($Player.life)
	$Screen/Ammo.text = "ammo " + str(Weapon.ammo)
	#$Screen/Zombies.text = "zombies " + str(Weapon.ammo)



func _on_Player_shoot(direction, location):
	if ($GunDelay.time_left == 0):
		$GunDelay.wait_time = Weapon.loading
		$GunDelay.start()
		var shoots = Weapon.create_shoots(direction, location)
		for shoot in shoots:
			$Shoots.add_child(shoot)



func _on_Shotgun_empty_ammo():
	Weapon = Pistol.instance()



func _on_Rifle_empty_ammo():
	Weapon = Pistol.instance()



func _on_Enemy_body_entered(body):
	print("hit in game node")

#
#
#
#func _on_Teste3_body_entered(body):
#	print("change pistol")
#	Weapon = Pistol.instance()
#
#
#
#func _on_Teste_body_entered(body):
#	print("change shotgun")
#	Weapon = Shotgun.instance()
#	Weapon.connect("empty_ammo", self, "_on_Shotgun_empty_ammo")
#
#
#
#func _on_Teste2_body_entered(body):
#	print("change rifle")
#	Weapon = Rifle.instance()
#	Weapon.connect("empty_ammo", self, "_on_Rifle_empty_ammo")

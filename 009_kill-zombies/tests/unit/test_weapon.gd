extends "res://addons/gut/test.gd"

var Shotgun = preload("res://scenes/weapon/Shotgun.gd").new()
var Bullet = preload("res://scenes/weapon/Bullet.tscn")


const MAX_LOOP_TEST = 500

const _PI_16 = PI / 16				# 0.196
const _PI_8 = PI / 8				# 0.393
const _15_PI_16 = 15 * PI / 16		# 2.945
const _PI = PI 						# 3.141

var direction = 0.0
var location = Vector2.ZERO
var speed = 0
var lifetime = 0.0
var damage = 0
var add = 0

func test_shotgun_bullet_damage_between_70_to_75():
	for i in range(0, MAX_LOOP_TEST):
		assert_between(Shotgun.bullet_damage(), 70, 75)


func test_shotgun_bullet_lifetime_between_01_to_015():
	for i in range(0, MAX_LOOP_TEST):
		assert_between(Shotgun.bullet_lifetime(), 0.1, 0.15)


func test_shotgun_bullet_speed_between_900_1000():
	for i in range(0, MAX_LOOP_TEST):
		assert_between(Shotgun.bullet_speed(), 900, 1000)


# direction can be -PI to PI float value
# add angle is the new angle must add with the limit -PI and PI
func test_shotgun_change_direction():
	direction = 0
	add = _PI_16
	assert_eq(Shotgun.change_direction(direction, add), _PI_16, "new direction != PI/16")

	direction = 0
	add = -_PI_8
	assert_eq(Shotgun.change_direction(direction, add), -_PI_8, "new direction != -PI/8")


func test_shotgun_change_direction_until_limit():
	direction = _15_PI_16
	add = _PI_8
	assert_eq(Shotgun.change_direction(direction, add), _PI, "new direction > PI")
	
	direction = -_15_PI_16
	add = -_PI_8
	assert_eq(Shotgun.change_direction(direction, add), -_PI, "new direction < -PI")
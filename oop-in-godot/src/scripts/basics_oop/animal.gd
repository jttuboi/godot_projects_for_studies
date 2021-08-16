extends KinematicBody2D

enum GENDER { MALE, FEMALE }

export (String) var _name: String
export (GENDER) var sex: int
export (int) var age: int
export (float) var weight: float
export (Color) var color: Color
export (String) var texture_hair: String

export (Texture) var texture setget set_texture, get_texture
func set_texture(value: Texture):
	$Sprite.texture = value
func get_texture():
	return $Sprite.texture


func breathe():
	pass


func eat(food: String):
	pass


func run(destination: Vector2):
	pass


func sleep(hours: float):
	pass

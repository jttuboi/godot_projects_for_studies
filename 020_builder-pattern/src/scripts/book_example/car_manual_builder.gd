extends "builder.gd"

const Manual = preload("res://src/scenes/book_example/manual.tscn")

var _manual: Manual


func _ready():
	reset()


func reset():
	_manual = Manual.instance()


func set_seats(number: int):
	_manual.seats = number


func set_engine(engine: String):
	_manual.engine = engine


func set_trip_computer():
	_manual.trip_computer = "android wear documentation"


func set_gps():
	_manual.gps = "gps NASA documentation"


# this reset isn´t mandatory, but it´s good to restart after create a product
# otherwise you need do reset explicitly
func get_result() -> Manual:
	var product = _manual
	reset()
	return product

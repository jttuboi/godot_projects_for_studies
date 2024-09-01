extends "builder.gd"

const Car = preload("res://src/scenes/book_example/car.tscn")

var _car: Car


func _ready():
	reset()


func reset():
	_car = Car.instance()


func set_seats(number: int):
	_car.seats = number


func set_engine(engine: String):
	_car.engine = engine


func set_trip_computer():
	_car.trip_computer = "android wear"


func set_gps():
	_car.gps = "gps NASA"


# this reset isn´t mandatory, but it´s good to restart after create a product
# otherwise you need do reset explicitly
func get_result() -> Car:
	var product = _car
	reset()
	return product

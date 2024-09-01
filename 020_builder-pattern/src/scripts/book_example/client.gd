extends Node2D

var Director = load("res://src/scripts/book_example/director.gd")
var CarBuilder = load("res://src/scripts/book_example/car_builder.gd")
var CarManualBuilder = load("res://src/scripts/book_example/car_manual_builder.gd")

var director: Director
var car: Car
var manual: Manual


func _ready():
	director = Director.new()
	
	request_a_car()
	request_the_manual()
	read_the_manual()
	test_the_car()


func request_a_car():
	print("== client requests a car")
	var builder = CarBuilder.new()
	director.make_sports_car(builder)
	car = builder.get_result()
	print("== client got a car")


func request_the_manual():
	print("== client requests the manual")
	var builder = CarManualBuilder.new()
	director.make_sports_car(builder)
	manual = builder.get_result()
	print("== client got a manual")


func test_the_car():
	print("== client tests the car")
	if car:
		car.run()
	print("== turn off the car")


func read_the_manual():
	print("== client reads the manual")
	if manual:
		manual.read()
	print("== close the manual")

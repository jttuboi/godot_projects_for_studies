extends Node2D
class_name Manual

var seats: int
var engine: String
var trip_computer: String
var gps: String


func read():
	print("this manual has a description of the car")
	
	var text := ""
	if seats > 0:
		text += "it has " + str(seats) + " seats"
	if not engine.empty():
		text += ", " + engine + " engine "
	if not trip_computer.empty():
		text += ", " + trip_computer
	if not gps.empty():
		text += ", " + gps
	print(text, ".")
	

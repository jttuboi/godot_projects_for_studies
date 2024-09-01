extends Node2D
class_name Car

var seats: int
var engine: String
var trip_computer: String
var gps: String


func run():
	var text := ""
	if seats > 0:
		text += "this car has " + str(seats) + " seats"
	if not engine.empty():
		text += " with " + engine + " engine"
	if not trip_computer.empty():
		text += " and it has a powerful " + trip_computer
	if not gps.empty():
		text += " plus " + gps
	print(text, ". vrum vrumm.")

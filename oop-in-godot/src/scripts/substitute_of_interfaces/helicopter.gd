extends "vehicle.gd"


func _init():
	print("== created a helicopter\n")


func fly(origin: String, destination: String, passengers: int):
	print("== inside of helicopter")
	print("welcome!")
	print("you´re going with me today.")
	print("we´re going to ", destination, " with you ", str(passengers), ".")
	print("say good bye to ", origin, ".\n")

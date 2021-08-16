extends "vehicle.gd"


func _init():
	print("== created an airplane\n")


func fly(origin: String, destination: String, passengers: int):
	print("== inside of airplane")
	print("welcome to dragon ball airplane company.")
	print("we´re going to ", destination, " from ", origin, ".")
	print("today we have ", str(passengers), "passengers. fasten your seat belts, the pilot is missing.\n")

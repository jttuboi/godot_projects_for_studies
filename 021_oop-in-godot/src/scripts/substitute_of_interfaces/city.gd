extends Node2D

const Helicopter = preload("res://src/scenes/substitute_of_interfaces/helicopter.tscn")
const TransportedGryphon = preload("res://src/scenes/substitute_of_interfaces/domesticated_gryphon.tscn")
const Airplane = preload("res://src/scenes/substitute_of_interfaces/airplane.tscn")
const LuggageTransport = preload("res://src/scenes/substitute_of_interfaces/luggage_transport.tscn")

var vehicles := []


func _ready():
	print("== creating vehicles\n")
	vehicles.append(Helicopter.instance())
	vehicles.append(TransportedGryphon.instance())
	vehicles.append(Airplane.instance())
	vehicles.append(LuggageTransport.instance())
	
	print("== sending vehicles to airport\n")
	for vehicle in vehicles:
		$Airport.accept(vehicle)

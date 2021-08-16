extends Node2D

var vehicles := []


func _ready():
	print("== open airport\n")


# here the duck typing is applied
# godot doesn´t have interface like as OOP language, because the architecture is based on nodes/tree,
# but you can directly use has_method() to execute the particular function
#
# see more in: https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_advanced.html#duck-typing
func accept(vehicle: Vehicle):
	print("== checking if is flying transport")
	
	if vehicle.has_method("fly"):
		print("== ", vehicle.name, " is a flying transport, you can enter =)\n")
		vehicle.fly("my home", "neverland", 2)
	else:
		print("== ", vehicle.name, " is not a flying transport, you are rejected =(\n")

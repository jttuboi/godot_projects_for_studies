extends Node
class_name Director


func make_suv(builder: Builder):
	builder.reset()
	
	if builder.has_method("set_seats"):
		builder.set_seats(4)
	
	if builder.has_method("set_engine"):
		builder.set_engine("SUVEngine")
	
	if builder.has_method("set_trip_computer"):
		builder.set_trip_computer()
	
	if builder.has_method("set_gps"):
		builder.set_gps()


func make_sports_car(builder: Builder):
	builder.reset()
	
	if builder.has_method("set_seats"):
		builder.set_seats(2)
	
	if builder.has_method("set_engine"):
		builder.set_engine("SportEngine")
	
	if builder.has_method("set_trip_computer"):
		builder.set_trip_computer()
	
	if builder.has_method("set_gps"):
		builder.set_gps()

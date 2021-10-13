extends RayCast 

export(Resource) var _runtime_data = _runtime_data as RuntimeData

var _is_mousing_over := false


func _input(event: InputEvent):
	var collided_area: Area = get_collider()
	
	if collided_area is Food:
		if not _is_mousing_over:
			_is_mousing_over = true
			Signals.emit_signal('food_moused_over', collided_area)
		if event is InputEventMouseButton and event.pressed \
				and _runtime_data.current_gameplay_state == Enums.GAMEPLAY_STATE.FREEWALK:
			Signals.emit_signal('food_clicked', collided_area)
	
	elif _is_mousing_over:
		_is_mousing_over = false
		Signals.emit_signal('food_moused_out')

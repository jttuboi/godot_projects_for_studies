extends Area2D

class_name Card

signal flipped(card)

var _flipped := false
var type: int



func _draw():
	if _flipped:
		match type:
			1: _draw_circle(Color.blue)
			2: _draw_circle(Color.red)
			3: _draw_circle(Color.green)
			4: _draw_circle(Color.magenta)
			5: _draw_circle(Color.cyan)
			6: _draw_circle(Color.yellow)
			7: _draw_rect(Color.blue)
			8: _draw_rect(Color.red)
			9: _draw_rect(Color.green)
			10: _draw_rect(Color.magenta)
			11: _draw_rect(Color.cyan)
			12: _draw_rect(Color.yellow)
			13: _draw_triangle(Color.blue)
			14: _draw_triangle(Color.red)
			15: _draw_triangle(Color.green)
			16: _draw_triangle(Color.magenta)
			17: _draw_triangle(Color.cyan)
			18: _draw_triangle(Color.yellow)
	else:
		_draw_back()


func flip():
	_flipped = true
	update()


func unflip():
	yield(_create_timer(0.5), 'timeout')
	_flipped = false
	update()


func is_equals_to(card: Area2D):
	return type == card.type


func _draw_circle(color: Color):
	_draw_back()
	draw_circle(Vector2(0, 0), 20, color)


func _draw_rect(color: Color):
	_draw_back()
	draw_rect(Rect2(-20, -20, 40, 40), color)


func _draw_triangle(color: Color):
	_draw_back()
	draw_polygon(PoolVector2Array([Vector2(0, -20), Vector2(20, 20), Vector2(-20, 20)]),
			PoolColorArray([color, color, color]))


func _draw_back():
	draw_rect(Rect2(-25, -25, 50, 50), Color.white)


func _is_button_left_clicked(event: InputEvent):
	return event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed
	
	# better solution
	# return event.is_action_pressed("ui_flip")


func _on_Card_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if _is_button_left_clicked(event) and not _flipped:
		emit_signal("flipped", self)


###############################################################################
# It's a timer to self created and destroyed after used.
# 
# Example
# ~~~~~
# The string after will print after 0.1 seconds before printed.
# 
# print('before')
# yield(_create_timer(0.1), 'timeout')
# print('after')
###############################################################################
func _create_timer(wait_time: float):
	var timer := Timer.new()
	timer.set_wait_time(wait_time)
	timer.set_one_shot(true)
	timer.connect("timeout", timer, "queue_free")
	add_child(timer)
	timer.start()
	return timer

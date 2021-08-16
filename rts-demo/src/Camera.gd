extends Camera2D

export var speed: float = 19 #10.0

export var zoom_speed: float = 10.0
export var zoom_margin: float = 0.1
export var zoom_min: float = 0.5 #0.25
export var zoom_max: float = 3.0

export var pan_speed: float = 10.0
export var margin_x: float = 200.0
export var margin_y: float = 100.0

var zoom_pos: Vector2 = Vector2.ZERO
var zoom_factor: float = 1.0
var zooming: bool = false

var mouse_pos: Vector2 = Vector2.ZERO
var mouse_pos_global: Vector2 = Vector2.ZERO

var start: Vector2 = Vector2.ZERO
var startv: Vector2 = Vector2.ZERO
var end: Vector2 = Vector2.ZERO
var endv: Vector2 = Vector2.ZERO

var is_dragging: bool = false

signal area_selected

var input_x
var input_y

onready var DrawRect = $"../UI/Base/DrawRect"

# https://godotengine.org/qa/2721/more-realistic-parallax-in-2d-when-zooming-in-out

func _ready():
	var Data = $"../UI/Base/Data"
	Data.rect_position.x = position.x - 490
	Data.rect_position.y = position.y - 280


func _process(delta):
	
	# calculate the direction of the camera movement
	input_x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	# give a smooth movement to movement
	position.x = lerp(position.x, position.x + input_x * speed * zoom.x, speed * delta)
	position.y = lerp(position.y, position.y + input_y * speed * zoom.y, speed * delta)
	
	# give a movement when the mouse is near of the border
	# you need press control in this tutorial
	# 
	# abs(mouse_pos.x - margin_x) / margin_x
	# this part gives a acelerated movement, when you are near of center, it goes slower, but if you are near of border screen, it goes faster
	if Input.is_key_pressed(KEY_CONTROL):
		if mouse_pos.x < margin_x:
			position.x = lerp(position.x, position.x - abs(mouse_pos.x - margin_x) / margin_x * pan_speed * zoom.x, pan_speed * delta)
		elif mouse_pos.x > OS.window_size.x - margin_x:
			position.x = lerp(position.x, position.x + abs(mouse_pos.x - OS.window_size.x + margin_x) / margin_x * pan_speed * zoom.x, pan_speed * delta)
		if mouse_pos.y < margin_y:
			position.y = lerp(position.y, position.y - abs(mouse_pos.y - margin_y) / margin_y * pan_speed * zoom.y, pan_speed * delta)
		elif mouse_pos.y > OS.window_size.y - margin_y:
			position.y = lerp(position.y, position.y + abs(mouse_pos.y - OS.window_size.y + margin_y) / margin_y * pan_speed * zoom.y, pan_speed * delta)
	
	if Input.is_action_just_pressed("ui_left_mouse_button"):
		start = mouse_pos_global
		startv = mouse_pos
		is_dragging = true
	if is_dragging:
		end = mouse_pos_global
		endv = mouse_pos
		draw_area()
	if Input.is_action_just_released("ui_left_mouse_button"):
		if startv.distance_to(mouse_pos) > 20:
			end = mouse_pos_global
			endv = mouse_pos
			is_dragging = false
			draw_area(false)
			emit_signal("area_selected")
		else:
			end = start
			is_dragging = false
			draw_area(false)
	
	# calculate the zoom value giving a smooth movement
	zoom.x = lerp(zoom.x, zoom.x * zoom_factor, zoom_speed * delta)
	zoom.y = lerp(zoom.y, zoom.y * zoom_factor, zoom_speed * delta)
	
	# limit how much you can zoom in or out
	zoom.x = clamp(zoom.x, zoom_min, zoom_max)
	zoom.y = clamp(zoom.y, zoom_min, zoom_max)
	
	if not zooming:
		zoom_factor = 1.0
	
	print_data()


func _input(event):
	# ???????????
	if abs(zoom_pos.x - get_global_mouse_position().x) > zoom_margin:
		zoom_factor = 1.0
	if abs(zoom_pos.y - get_global_mouse_position().y) > zoom_margin:
		zoom_factor = 1.0
	
	# give values to zoom when player uses wheel of the mouse
	if event is InputEventMouseButton:
		if event.is_pressed():
			zooming = true
			if event.button_index == BUTTON_WHEEL_UP:
				zoom_factor -= 0.01 * zoom_speed
				zoom_pos = get_global_mouse_position()
			if event.button_index == BUTTON_WHEEL_DOWN:
				zoom_factor += 0.01 * zoom_speed
				zoom_pos = get_global_mouse_position()
		else:
			zooming = false
	
	if event is InputEventMouse:
		mouse_pos = event.position


func draw_area(s = true):
	DrawRect.rect_size = Vector2(abs(startv.x - endv.x), abs(startv.y - endv.y))
	
	var pos = Vector2()
	pos.x = min(startv.x, endv.x)
	pos.y = min(startv.y, endv.y)
	pos.y -= OS.window_size.y
	DrawRect.rect_position = pos
	
	DrawRect.rect_size *= int(s) # true = 1 and false = 0

func print_data():
	var Data = $"../UI/Base/Data"
	
	var s = ""
	s += str("position: ", position, "\n")
	s += str("speed: ", speed, "\n")
	s += str("direction: ", print_direction(), "\n")
	s += str("\n")
	s += str("zoom: ", zoom, "\n")
	s += str("zoom_pos: ", zoom_pos, "\n")
	s += str("zoom_speed: ", zoom_speed, "\n")
	s += str("zoom_factor: ", zoom_factor, "\n")
	s += str("zoom_margin: ", zoom_margin, "\n")
	s += str("zooming: ", zooming, "\n")
	s += str("\n")
	s += str("zoom_min: ", zoom_min, "\n")
	s += str("zoom_max: ", zoom_max, "\n")
	Data.text = s

func print_direction():
	var direction_x = "-----"
	if input_x == 1:
		direction_x = "RIGHT"
	elif input_x == -1:
		direction_x = " LEFT"
		
	var direction_y = "-----"
	if input_y == 1:
		direction_y = " DOWN"
	elif input_y == -1:
		direction_y = "   UP"
	
	return str("(", direction_x, ", ", direction_y, ")")
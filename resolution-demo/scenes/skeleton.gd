extends Sprite

enum Direction { UP, LEFT, DOWN, RIGHT }

var direction = Direction.RIGHT
var timer
var crazy_direction = -1



func _ready():
	timer = Timer.new()
	timer.connect("timeout", self, "_on_Skeleton_tick")
	timer.wait_time = 0.2
	add_child(timer)
	timer.start()


func _input(event):
	if event.is_action_pressed("ui_left"):
		direction = Direction.LEFT
		frame = begin_frame()
	elif event.is_action_pressed("ui_right"):
		direction = Direction.RIGHT
		frame = begin_frame()
	elif event.is_action_pressed("ui_down"):
		direction = Direction.DOWN
		frame = begin_frame()
	elif event.is_action_pressed("ui_up"):
		direction = Direction.UP
		frame = begin_frame()


func _process(delta):
	translate(Vector2(crazy_direction * 100, 0))
	crazy_direction = crazy_direction * (-1)
	print(position)


func _on_Skeleton_tick():
	if frame < end_frame():
		frame += 1
	else:
		frame = begin_frame()


func end_frame():
	match direction:
		Direction.UP:
			return 12
		Direction.LEFT:
			return 25
		Direction.DOWN:
			return 38
		Direction.RIGHT:
			return 51


func begin_frame():
	match direction:
		Direction.UP:
			return 0
		Direction.LEFT:
			return 13
		Direction.DOWN:
			return 26
		Direction.RIGHT:
			return 39
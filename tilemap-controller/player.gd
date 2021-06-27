extends KinematicBody2D
class_name Player



func _ready():
	_set_camera_border_limit()


func _physics_process(_delta: float):
	move_and_collide(_get_direction() * Consts.PLAYER_SPEED)


func _set_camera_border_limit():
	$Camera.limit_left = 0
	$Camera.limit_top = 0
	$Camera.limit_right = Consts.TILE_SIZE * Consts.CHUNK_SIZE * Consts.BLOCKS_WIDTH_SIZE
	$Camera.limit_bottom = Consts.TILE_SIZE * Consts.CHUNK_SIZE * Consts.BLOCKS_HEIGHT_SIZE


func _get_direction():
	return Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	)


func get_save_data():
	return { "position": position }


func set_load_data(data: Dictionary):
	position = data.position

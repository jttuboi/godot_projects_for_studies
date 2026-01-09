extends CharacterBody3D


const SPEED = 4.0
const JUMP_VELOCITY = 4.5
const CAM_UP := 80.0
const CAM_DOWN := -40.0

@export var mouse_sensitivity := 0.2

var show_mouse := false
var running: bool
var input_dir: Vector2
var direction: Vector3
var speed := SPEED

@onready var head: Node3D = $"Head"


func _ready() -> void:
	# limita o mouse para não sair da tela. mais especificamente ele esconde o cursor, e centraliza-o na tela.
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not show_mouse:
		# gira o corpo inteiro do player em relação ao Y (gira pros lados, pois o eixo é vertical)
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))

		# gira a cabeça do player, onde o eixo é horizontal (para cima e para baixo) (o eixo Z ele inclina pro lado esquerdo/direito)
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sensitivity))

		# limita o angulo de inclinação da cabeça com o mínimo e o máximo (respectivamente para baixo e para cima)
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(CAM_DOWN), deg_to_rad(CAM_UP))


func _physics_process(delta: float) -> void:
	#if not is_on_floor():
	#	velocity += get_gravity() * delta
	#
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("ui_cancel"):
		show_mouse = not show_mouse
		var mouse_mode := Input.MOUSE_MODE_VISIBLE if show_mouse else Input.MOUSE_MODE_CONFINED_HIDDEN
		Input.set_mouse_mode(mouse_mode)

	running = Input.is_action_pressed("ui_sprint")

	speed = SPEED * 1.5 if running else SPEED

	input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

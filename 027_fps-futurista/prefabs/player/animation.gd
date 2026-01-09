extends AnimationPlayer

@export var character: CharacterBody3D
@export var camera: Camera3D

var animation: String


func _process(delta: float) -> void:
	_animations()
	_neck_animation(delta)


func _animations() -> void:
	if not character.is_on_floor():
		_set_animation("jump", 0.3)
	else:
		if character.direction:
			if character.running:
				_set_animation("run", 0.1)
			else:
				_set_animation("walk", 0.3)
		else:
			_set_animation("idle", 0.3, 0.1)


func _neck_animation(delta: float) -> void:
	var rotation_speed: float = character.speed * delta
	var angle: float = 2 * (character.input_dir.x)
	camera.rotation.z = lerp(camera.rotation.z, -deg_to_rad(angle), rotation_speed)

func _set_animation(anim: String, custom_blend: float, custom_speed: float = 1.0) -> void:
	if animation != anim:
		animation = anim
		play(anim, custom_blend, custom_speed)

extends Particles2D


# process_material -> sprite is the shape of explosion.

# process_material -> radial accel + Time/speed_scale
# can control the center particles are more disperser than than border, giving a reallity of explosion in center are faster than border

func initialize(sprite: Texture):
	process_material.set_shader_param("emission_box_extents", Vector3(sprite.get_width() / 2.0, sprite.get_height() / 2.0, 1))
	process_material.set_shader_param("sprite", sprite)
	amount = sprite.get_width() * sprite.get_height()
	emitting = true


# texture -> sprite is the shape of particle.
#   if uses pixel.png, the shape will be square
#   if uses heart.png, the shape will be heart shape

# amount controls the quantity of particles to show per cicle

func set_heart_particle():
	texture = preload("res://explosion_effect/heart.png")
	amount = 300

extends Node2D

var colors = [
	Color.aqua,
	Color.aquamarine,
	Color.cadetblue,
	Color.cornflower,
	Color.darksalmon,
	Color.yellowgreen,
	Color.violet,
	Color.slateblue,
	Color.pink,
	Color.palegreen,
	Color.mediumpurple,
	Color.indianred,
	Color.lightsalmon,
]

func _ready():
	position = Vector2.ZERO
	($Transition/Circle.material as ShaderMaterial).set_shader_param("circle_size", 1.05)


func _on_ChangeScreen_pressed():
	$Animation.play("transition_screen_go_loading")
	
	yield($Animation, "animation_finished")
	
	$Background.color = colors[randi() % colors.size()]
	
	$Animation.play("transition_screen_leave_loading")

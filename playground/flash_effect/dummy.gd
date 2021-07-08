extends KinematicBody2D

const DURATION = 2 # sec


func initialize_by_animation():
	$Animation.play("flash")


# this you have less work to do because it doesn't need to animate "each frame".
# some works you can avoid animation and use tween instead
func initialize_by_tween():
	$Tween.remove_all()
	$Tween.interpolate_property($Sprite.material, "shader_param/flash_state", 0, 1, DURATION)
	$Tween.start()


func initialize_by_tween_in_out():
	$Tween.remove_all()
	$Tween.interpolate_property($Sprite.material, "shader_param/flash_state", 0, 1, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.5)
	$Tween.interpolate_property($Sprite.material, "shader_param/flash_state", 1, 0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 1.5)
	$Tween.start()
	

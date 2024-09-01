extends Sprite



func _ready():
	$Animation.play("fade_out")
	
	# apos o animation mandar uma signal animation_finished, 
	# ele continua executando para auto exclusao desse flare
	yield($Animation, "animation_finished")
	queue_free()
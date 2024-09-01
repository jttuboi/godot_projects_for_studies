extends Area2D

export var velocity = Vector2.ZERO

const Flare = preload("res://scenes/Flare.tscn")



func _ready():
	create_flare()
	
	# apos o visibility notifier mandar uma signal screen_exited, 
	# ele continua executando para auto exclusao desse laser
	yield($VisibilityNotifier2D, "screen_exited")
	queue_free()


func _process(delta):
	translate(velocity * delta)


func create_flare():
	var flare = Flare.instance()
	flare.position = position
	Utils.main_node.add_child(flare)
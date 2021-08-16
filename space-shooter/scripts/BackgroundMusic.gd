extends AudioStreamPlayer

var Music = preload("res://assets/sounds/music.ogg")



func _ready():
	stream = Music
	play()
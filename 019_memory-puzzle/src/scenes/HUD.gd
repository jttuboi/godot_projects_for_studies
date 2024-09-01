extends CanvasLayer

onready var Background := $Background
onready var Message := $Message



func _ready():
	hide_message()


func show_message():
	Background.show()
	Message.show()


func hide_message():
	Background.hide()
	Message.hide()

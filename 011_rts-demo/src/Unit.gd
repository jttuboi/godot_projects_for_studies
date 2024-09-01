extends KinematicBody2D

export var selected: bool = false setget set_selected

signal was_selected
signal was_deselected



func _ready():
	randomize()
	connect("was_selected", get_parent(), "_on_Unit_was_selected")
	connect("was_deselected", get_parent(), "_on_Unit_was_deselected")
	$Box.visible = false
	$Name.visible = false
	$Name.text = name
	$Life.visible = false
	$Life.value = randi() % 90 + 10


func _on_Unit_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_LEFT:
				set_selected(not selected)


func set_selected(value):
	if selected != value:
		selected = value
		$Box.visible = value
		$Name.visible = value
		$Life.visible = value
		if selected:
			emit_signal("was_selected", self)
		else:
			emit_signal("was_deselected", self)
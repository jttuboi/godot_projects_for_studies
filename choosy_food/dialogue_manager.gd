extends Control

export(NodePath) onready var _dialog_text = get_node(_dialog_text) as Label
export(NodePath) onready var _avatar = get_node(_avatar) as TextureRect
export(Resource) var _current_dialogue = _current_dialogue as Dialogue
export(Resource) var _runtime_data = _runtime_data as RuntimeData

var _current_slide_index := 0


func _ready():
	Signals.connect("dialog_initiated", self, '_on_Dialog_initiated')
	Signals.connect("dialog_finished", self, '_on_Dialog_finished')
	_avatar.texture = _current_dialogue.avatar_texture
	show_slide()


func _input(event):
	if Input.is_action_just_pressed('advance_slide'):
		if _current_slide_index < _current_dialogue.dialog_slides.size() - 1:
			_current_slide_index += 1
			show_slide()
		elif _runtime_data.current_gameplay_state == Enums.GAMEPLAY_STATE.IN_DIALOG:
			Signals.emit_dialog_finished()


func show_slide():
	_dialog_text.text = _current_dialogue.dialog_slides[_current_slide_index]


func _on_Dialog_initiated(dialogue: Dialogue):
	_runtime_data.current_gameplay_state = Enums.GAMEPLAY_STATE.IN_DIALOG
	_current_dialogue = dialogue
	_current_slide_index = 0
	visible = true
	_avatar.texture = _current_dialogue.avatar_texture
	show_slide()


func _on_Dialog_finished():
	_runtime_data.current_gameplay_state = Enums.GAMEPLAY_STATE.FREEWALK
	visible = false

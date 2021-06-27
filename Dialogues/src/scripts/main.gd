extends Node


func _on_ChangeLanguage_item_selected(id):
	match id:
		0:
			Consts.language = Consts.Language.ENGLISH
		1:
			Consts.language = Consts.Language.PORTUGUESE_BRAZILIAN
		2:
			Consts.language = Consts.Language.SPANISH

	Events.emit_signal("language_changed")

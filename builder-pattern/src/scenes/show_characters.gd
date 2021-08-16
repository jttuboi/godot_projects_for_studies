extends Label

var characters = []


func _init():
	Events.connect("character_created", self, "_on_Events_character_created")


func _process(delta: float):
	_show_results()


# signal doesn´t accept explicit type, so it's good to not filter it yet
func _on_Events_character_created(character):
	if character is Character:
		characters.append(character)


func _show_results():
	var new_text = ""
	for character in characters:
		new_text += character.information() + "\n"
	text = new_text

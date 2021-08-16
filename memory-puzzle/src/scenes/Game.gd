extends Node

var _number_cards_flipped := 0
var _first_flipped_card: Card

onready var Cards := $Cards
onready var HUD := $HUD



func _ready():
	randomize()
	for card in Cards.get_children():
		card.connect("flipped", self, "_on_Card_flipped")
	_mix_cards()


func _input(event: InputEvent):
	if event.is_action_pressed("ui_restart") and _is_all_cards_flipped():
		HUD.hide_message()
		_reset_cards_flipped()
		_unflip_all_cards()
		_mix_cards()


func _mix_cards():
	var cards_type = [ 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18 ]
	cards_type.shuffle()
	
	# give a type per card in each position
	for i in 36:
		Cards.get_child(i).type = cards_type[i]


func _unflip_all_cards():
	for card in Cards.get_children():
		card.unflip()


func _cards_are_the_same(card: Card):
	card.flip()
	_first_flipped_card = null


func _cards_are_different(card: Card):
	card.flip()
	_first_flipped_card.unflip()
	card.unflip()
	_first_flipped_card = null


func _increase_cards_flipped():
	_number_cards_flipped += 2


func _reset_cards_flipped():
	_number_cards_flipped = 0


func _is_all_cards_flipped():
	return _number_cards_flipped >= 36


func _check_end_game():
	if _is_all_cards_flipped():
		HUD.show_message()


func _on_Card_flipped(card: Card):
	if _first_flipped_card == null:
		_first_flipped_card = card
		_first_flipped_card.flip()
	else:
		if _first_flipped_card.is_equals_to(card):
			_cards_are_the_same(card)
			_increase_cards_flipped()
			_check_end_game()
		else:
			_cards_are_different(card)

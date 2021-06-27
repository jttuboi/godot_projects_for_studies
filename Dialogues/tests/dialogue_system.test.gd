extends WAT.Test

var dialogue_system: DialogueSystem
var player: Player
var npc1: Npc
var npc2: Npc
var npc3: Npc

func title():
	return "Dialogue System"


func pre():
	dialogue_system = DialogueSystem.new()


func test_when_has_sentence_without_token_get_the_same_unmodified_sentence():
	parameters([["sentence", "result"],
		["I'm free.", "I'm free."],
		["Goallllll!!!", "Goallllll!!!"],
		["What's this?", "What's this?"]])
	
	_execute_change_default_tokens(p)


func test_when_has_token_player_name_change_token_for_player_name():
	parameters([["sentence", "name", "result"],
		["{player_name}, how many do you want?", "Goku", "Goku, how many do you want?"],
		["I need get {player_name}'s seeds... Oh, hi, you're here.", "Atila, o tocador de campainha", "I need get Atila, o tocador de campainha's seeds... Oh, hi, you're here."]])

	_create_player(p.name)
	
	_execute_change_default_tokens(p)


func test_when_has_token_npcs_name_change_token_for_npcs_name_respectively():
	parameters([["sentence", "name", "result"],
		["{npc1_name} has a boyfriend.", "Chichi", "Chichi has a boyfriend."],
		["You need looking for {npc1_name}.", "Piccolo", "You need looking for Piccolo."]])

	_create_npc1(p.name)
	
	_execute_change_default_tokens(p)


func test_when_has_token_npc2_name_change_token_for_npc2_name():
	parameters([["sentence", "name", "result"],
		["{npc2_name} has a boyfriend.", "Chichi", "Chichi has a boyfriend."],
		["You need looking for {npc2_name}.", "Piccolo", "You need looking for Piccolo."]])
	
	_create_npc2(p.name)
	
	_execute_change_default_tokens(p)


func test_when_has_token_npc3_name_change_token_for_npc3_name():
	parameters([["sentence", "name", "result"],
		["{npc3_name} has a boyfriend.", "Chichi", "Chichi has a boyfriend."],
		["You need looking for {npc3_name}.", "Piccolo", "You need looking for Piccolo."]])
	
	_create_npc3(p.name)
	
	_execute_change_default_tokens(p)


func test_when_has_a_lot_of_default_tokens_change_default_tokens():
	parameters([["sentence", "player_name", "npc1_name", "npc2_name", "npc3_name", "result"],
		["{player_name}, you need go to square and talk with {npc1_name}, {npc3_name} and {npc2_name}.", 
		"Goku", "Gohan", "Piccolo", "Chichi",
		"Goku, you need go to square and talk with Gohan, Chichi and Piccolo."]])
	
	_create_player(p.player_name)
	_create_npc1(p.npc1_name)
	_create_npc2(p.npc2_name)
	_create_npc3(p.npc3_name)
	
	_execute_change_default_tokens(p)
	
#  {my_friend}{cow_article_gender} {cow_name} {answer}


func _create_player(name):
	player = Player.new()
	player._name = name
	dialogue_system.add_player(player)


func _create_npc1(name):
	npc1 = Npc.new()
	npc1._name = name
	dialogue_system.add_npc1(npc1)


func _create_npc2(name):
	npc2 = Npc.new()
	npc2._name = name
	dialogue_system.add_npc2(npc2)


func _create_npc3(name):
	npc3 = Npc.new()
	npc3._name = name
	dialogue_system.add_npc3(npc3)


func _execute_change_default_tokens(p):
	var actual = dialogue_system.change_default_tokens(p.sentence)
	var expected = p.result
	var context = "{sentence} = {result}".format(p)
	
	asserts.is_equal(actual, expected, context)


func post():
	dialogue_system.free()

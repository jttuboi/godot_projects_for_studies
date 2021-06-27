extends Node
class_name DialogueSystem

# system irá controlar
# - receber o dialogo do npc quando o jogador requisita uma conversa
# - processar a sentença {}
#   https://www.ulatus.com/translation-blog/internationalization-versus-localization-in-textual-translation/
# - passar para o dialogue_box 
# - abrir o dialogue box
# - fazer as transições de sentenças até finalizar
# - enviar uma ação para ser feita fora desse system (caso tenha)
# - atualizar o save temporario de eventos acontecidos (caso tenha)
# - fechar o dialogue box

# Formatting: Not everybody formats their date the same way. Time signatures are also not universal. Even numbers are not standard. Deciding where to put colons, commas, symbols and the like will make a huge difference in the readability of your final document.
# Symbols/Abbreviations: English speakers often do not realize that their symbols are not universal. When symbols are used in text, they can take on many different meanings based upon the target language. Other times, the symbol may have no meaning at all, in which case the intent of the content will have been lost without a proper translation. Consider such a simple abbreviation as E. for east: since the German word for east is osten, east would be O. Even if we agreed to use metric vs imperial or American units, a square kilometer (sq km) would be a German Quadratkilometer or qkm.
# Gender: English does not assign gender to most items, Spanish and French assign gender to just about everything, Japanese has gender, but also special rules for adults and children.
# Graphics: Items that are just fine in one culture may be meaningless in another culture, or, worse, offensive and derogatory. For example, the stork delivers babies in many cultures; however, in Japan, a stork and baby will not have the same meaning. Colors also have different meanings in different cultures. Not everybody associates white with purity, weddings, and truth.
# Legal Requirements: who has to sign documents, where do signatures go, are witnesses required, who is allowed to be a witness, and so forth. If you are doing business in an international community, these are essential elements of translation.

export (PackedScene) var player
export (PackedScene) var npc1
export (PackedScene) var npc2
export (PackedScene) var npc3


func _ready():
	Events.connect("npc_initiated_dialogue", self, "_on_Events_npc_initiated_dialogue")
	$DialogueBox.hide()


func _on_Events_npc_initiated_dialogue(dialogues):
	# aqui ele deve ser as situacoes como, horas, onde, se eh evento ou nao, etc.
	#print(dialogues)
	var start = dialogues["gossiping"]["start"]
	var sentences = dialogues["gossiping"]["sentences"]
	
	#var answers = sentences[start]["answers"]
	#var custom_tokens = sentences[start]["custom_tokens"]
	
	print(sentences[start]["sentence"])
	var sentence_processed = process_tokens(sentences[start])
	print(sentence_processed)
	
	
	
	
	$DialogueBox.show()


func process_tokens(sentence_block):
	var sentence = sentence_block["sentence"]
	var processed_sentence = change_default_tokens(sentence)
	return processed_sentence


func change_default_tokens(sentence):
	var formatted_sentence = sentence
	
	formatted_sentence = formatted_sentence.format({
		"player_name": player._name if player != null else "",
		"npc1_name": npc1._name if npc1 != null else "",
		"npc2_name": npc2._name if npc2 != null else "",
		"npc3_name": npc3._name if npc3 != null else ""
	})
		
	return formatted_sentence


func add_player(player: Player):
	self.player = player


func add_npc1(npc1: Npc):
	self.npc1 = npc1


func add_npc2(npc2: Npc):
	self.npc2 = npc2


func add_npc3(npc3: Npc):
	self.npc3 = npc3










# extras
# precisa exportar o jogo para ver como sera salvo o json (eles precisam ser compactados, ver como fazer)
# https://docs.godotengine.org/en/stable/getting_started/workflow/export/exporting_projects.html
# precis aver como encriptar o save do jogo
#https://docs.godotengine.org/en/3.2/tutorials/io/encrypting_save_games.html

#{
#	"KEY": {
#		"name": "",							# name of the character
#		"expression": "neutral",			# neutral, 
#		"message": "MESSAGE {TOKEN}",		# message which will appear
#		"tokens": [ "TOKEN" ],				# tokens to substitute, some of them is default. "players_name", "article_the_single"
#		"next": "NEXT_KEY",					# next token to appear
#		"options": {						# options if have it
#			"1": "OPTION_1",
#			"2": "OPTION_2",
#			"3": "OPTION_3"
#		},
#		"action": "ACTION"					# actions to do after
#	}
#	...
#}

#func _ready():
#	Events.connect("language_changed", self, "_on_Events_language_changed")
#	Events.connect("npc_has_contacted", self, "_on_Events_npc_has_contacted")
#	Events.connect("npc_entered_on_the_map", self, "_on_Events_npc_entered_on_the_map")
#	Events.connect("npc_exited_on_the_map", self, "_on_Events_npc_exited_on_the_map")
#
#
#
#func _on_Events_language_changed():
#	load_dialogues()
#
#
#func _on_Events_npc_has_contacted(npc):
#	var dialogues = npcs_dialogues[npc]
#	print(dialogues)
	

#func call_dialog_box():
#
#	if dialog_box == null:
#		dialog_box = DialogBox.new()
#	else:
#		# limpa dialogo
#
#	#1
#	#coloca dados
#
#	#se tem next
#	# chama de novo
#	# senao deleta

#func interact():
#	var dialogue = load_dialogue(dialogue_file_path)
#	yield(local_map.play_dialogue(dialogue), "completed")
#	emit_signal("finished")

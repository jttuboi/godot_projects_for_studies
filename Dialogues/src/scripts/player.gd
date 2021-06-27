extends "character.gd"
class_name Player
# Dialogues

# ele envia um signal que mudou pro mapa tal
# assim todos npcs ali presentes conseguem saber que devem ser carregados, nesse caso carregar os dialogos

# ele tem a açao de conversar com o npc
# simulação
# se estao no mesmo mapa, as teclas 1 2 ou 3 ficam desabilitadas
# se estao em mapa diferente, as teclas 1 2 ou 3 ficam bloqueadas
# ao clicar as teclas, os botões estão simulando como se estivesse perto do npc e ativa a conversa


func _ready():
	Events.connect("player_location_requested", self, "_on_Events_player_location_requested")


func _input(event: InputEvent):
	if event.is_action_pressed("talk_npc1"):
		Events.emit_signal("player_contacted", "npc1", location)
	elif event.is_action_pressed("talk_npc2"):
		Events.emit_signal("player_contacted", "npc2", location)
	elif event.is_action_pressed("talk_npc3"):
		Events.emit_signal("player_contacted", "npc3", location)
	elif event.is_action_pressed("walk_left"):
		walk_left()
	elif event.is_action_pressed("walk_right"):
		walk_right()


func _on_Events_player_location_requested(npc_requester):
	Events.emit_signal("player_location_sended", npc_requester, location)


func walk_left():
	match location:
		Consts.Location.HOUSE:
			pass # nothing to do
		Consts.Location.TOWN:
			location = Consts.Location.HOUSE
			position -= Vector2(300, 0)
			change_map()
		Consts.Location.MARKET:
			location = Consts.Location.TOWN
			position -= Vector2(300, 0)
			change_map()


func walk_right():
	match location:
		Consts.Location.HOUSE:
			location = Consts.Location.TOWN
			position += Vector2(300, 0)
			change_map()
		Consts.Location.TOWN:
			location = Consts.Location.MARKET
			position += Vector2(300, 0)
			change_map()
		Consts.Location.MARKET:
			pass # nothing to do


func change_map():
	Events.emit_signal("player_changed_of_the_map", location)

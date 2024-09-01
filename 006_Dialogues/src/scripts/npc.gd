extends "character.gd"
class_name Npc
# Dialogues

# cada npc terá seu controle de dialogues

# eles devem ser carregados se está no mesmo mapa do player
# os npcs escutam a signal se o player entrar no mapa

# eles tambem devem fazer uma coisa extra, quando eles mudam de mapa
# eles devem verificar qual mapa o jogador esta para ver se ele deve carregar os dados, nesse caso os dialogos

# os npcs devem escutar o signal do mudar idioma, se ele for mudado, ele deve recaregar com o idioma mudado

export(Color) var color = Color.white setget set_color
var max_count = 300
var count = 0

var dialogues = {}


func _ready():
	Events.connect("player_contacted", self, "_on_Events_player_contacted")
	Events.connect("player_changed_of_the_map", self, "_on_Events_player_changed_of_the_map")
	Events.connect("language_changed", self, "_on_Events_language_changed")
	Events.connect("player_location_sended", self, "_on_Events_player_location_sended")
	
	# temp
	randomize()
	max_count = randi() % 100 + 200
	$Sprite.modulate = color


func _process(delta):
	$HasDialogue.text = str(dialogues) if dialogues.empty() else show_partial_dialogues()
	
	if count > max_count:
		automatic_walk()
		count = 0
	count += 1


func _on_Events_player_contacted(id, location):
	if self._id == id:
		if self.location == location:
			# ainda precisa selecionar o dialogo q deve ser enviado para o system
			print(id, " ", location)
			Events.emit_signal("npc_initiated_dialogue", dialogues)



func _on_Events_player_changed_of_the_map(player_location):
	update_dialogues(player_location)


func _on_Events_language_changed():
	if dialogues.empty():
		return
	
	load_dialogue()


func _on_Events_player_location_sended(npc_requester, player_location):
	if _id == npc_requester:
		update_dialogues(player_location)


func update_dialogues(player_location):
	if location == player_location:
		load_dialogue()
	else:
		dialogues.clear()


func load_dialogue():
	var path = "res://dialogues/" + _id + "-" + Consts.language + ".json"
	
	var file = File.new()
	#assert(file.file_exists(path))

	file.open(path, File.READ)

	dialogues = JSON.parse(file.get_as_text()).result

	file.close()


func automatic_walk():
	var left_or_right = randi() % 2		# 0 or 1
	if left_or_right == 0:
		# go to left
		if location == Consts.Location.TOWN:
			# change to market
			location = Consts.Location.MARKET
			position += Vector2(300, 0)
			after_change_map_check_dialogue()
	else:
		# go to right
		if location == Consts.Location.MARKET:
			# change to town
			location = Consts.Location.TOWN
			position -= Vector2(300, 0)
			after_change_map_check_dialogue()


func after_change_map_check_dialogue():
	# ele trocou de tela, precisa verificar se o player esta msm mapa
	Events.emit_signal("player_location_requested", _id)
	# o tratamento é feito no retorno da location


func show_partial_dialogues():
	return str(dialogues).substr(0, 10) + " ... }"


func set_color(new_color):
	color = new_color
	if is_inside_tree():
		$Sprite.modulate = new_color

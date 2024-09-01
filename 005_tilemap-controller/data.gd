extends Node



func get_save_filenames():
	var filenames = []
	
	var directory = Directory.new()
	if not directory.dir_exists(Consts.SAVE_PATH):
		return []
	
	directory.open(Consts.SAVE_PATH)
	directory.list_dir_begin(true, true)
	
	while true:
		var filename = directory.get_next()
		if filename == "":
			break
		if filename.ends_with(".sav"): # only accept sav file
			filenames.append(filename)
	
	directory.list_dir_end()
	
	return filenames


func save_world(world: Node2D):
	print("Data::save_world")
	var directory = Directory.new()
	if not directory.dir_exists(Consts.SAVE_PATH):
		directory.make_dir(Consts.SAVE_PATH)

	var filename = Consts.SAVE_PATH + ProjectSettings.get("custom/world/name") + Consts.SAVE_EXTENSION
	var file = File.new()
	file.open(filename, File.WRITE)
	
	# game version
	file.store_16(ProjectSettings.get("custom/game/version"))
	
	# modification file
	file.store_var(false)
	
	# chunks
	# nesse momento, o arquivo está em 2 situaçoes
	# ou ele foi recem criado, ou ele foi 
	#get_tree().get_nodes_in_group("chunks")[0]
	#deve salvar todo os chunks
	
	# rest of data
	for node in get_tree().get_nodes_in_group("data"):
		file.store_var(node.get_save_data())
	
	file.close()
	
	# duplicate file into backup
	var backup_filename = Consts.SAVE_PATH + ProjectSettings.get("custom/world/name") + Consts.BACKUP_EXTENSION
	directory.copy(filename, backup_filename)
	
#	file.store_var(world_name)
#	file.store_16(version)
#	file.store_var(backpack)
#	file.store_var(items_bar)
#	file.store_var(player)
	print("  game saved!")


func load_world(filename: String):
	print("Data::load_world")
	print(filename)
	
	var file  = File.new()
	if not file.file_exists(filename):
		# se nao tiver o .sav, usar o .bak
		
		# deve fazer o tratamento como se estivesse pegando os dados default
		# ou deve gerar um erro na tela quando algo estiver corrompido
		return

	file.open(filename, File.READ)
#
#	world_name = file.get_var()
#	version = file.get_16()
#	backpack = file.get_var()
#	items_bar = file.get_var()
#	player = file.get_var()
#
#	#file.store ########################################################################
#	# aqui precisa pegar cada item e salvar no temporario
#	# DEVE MANDAR UM SIGNAL E CADA NODE CONTROLLER DEVE FAZER SUAS PROPRIAS ATUALIZACOES
#

	file.close()


func save_chunks():
	pass

#
#como deve funcionar o jogo
#
#- new world (acontece quando clica no botao new no main menu)
#	pegar nome do jogo
#
#	gerar os chunks
#	gerar a posição do player
#
#	criar o arquivo (.sav) com o nome do jogo
#	salvar a versão do jogo
#	salvar a flag modified = false
#	salvar os dados dos chunks
#	salvar os dados do player
#
#	duplicar o arquivo .sav para .bak
#
#	criar o world
#	setar os chunks ao redor do player
#	setar posição do player
#
#
#- save world (acontece quando clica no botao save no world menu, depois de 10 min de jogo, depois que sai do jogo**)
#	pegar o world
#
#	abrir o arquivo .sav (nesse momento, ele pode estar modificado ou não)
#
#
#	salvar os dados do jogo
#	setar a flag temporary = false
#
#	duplicar o .sav para .bak
#
#** talvez isso não aconteça em algumas situações, aí aparece uma mensagem se deseja sair sem salvar
#
#- o load deve (acontece quando clica no botao load no main menu ou world menu)
#	abrir o arquivo .sav
#	se o .sav estiver corrompido
#		utilizar o .bak
#		abrir o arquivo .bak
#		criar um novo mundo***
#		carregar os dados do jogo (excecao aos chunks q deve ser parcial)
#		duplicar o .bak para .sav
#	se a flag temporary = true
#		utilizar o .bak
#		abrir o arquivo .bak
#		criar um novo mundo***
#		carregar os dados do jogo (excecao aos chunks q deve ser parcial)
#		duplicar o .bak para .sav
#	se a flag temporary = false
#		utilizar o .sav
#		abrir o arquivo .sav
#		criar um novo mundo
#		carregar os dados do jogo (excecao aos chunks q deve ser parcial)
#
#- o save chunks deve (acontece durante a transicao de chunks)
#	se a var file nao estiver aberta
#		abrir o arquivo .sav
#
#	setar a flag temporary = true
#	carregar os chunks que serao carregados
#	salvar os chunks que serao descarregados
#	limpar os chunks descarregados da memoria
#	persistir o arquivo

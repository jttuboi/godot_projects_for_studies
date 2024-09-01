extends ColorRect


func set_info(file_name: String, game_name: String, version: int, data: Dictionary):
	$Filename.text = file_name
	$GameName.text = game_name
	$Version.text = str(version)
	$Data.text = str(data)

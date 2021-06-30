class_name WorldData2
extends Resource

export (Dictionary) var info_data = {}
export (Dictionary) var data = {}


func _to_string():
	var string = ""
	string += "=== info data ===\n"
	for key in info_data.keys():
		string += "{0} = {1}\n".format([ key, info_data[key] ])
	string += "=== data ===\n"
	for key in data.keys():
		string += "{0} = {1}\n".format([ key, data[key] ])
	return string

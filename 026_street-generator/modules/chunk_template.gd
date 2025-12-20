extends RefCounted
class_name ChunkTemplate

var id: String = ''
var exits := {'N': false, 'E': false, 'S': false, 'W': false}
var is_empty: bool = true


# id = 'chunk_%d_%d' % [col, row]
func _init(_id: String = '', _exits: Dictionary = {}):
	id = _id
	if _exits.size() > 0:
		exits = {
			'N': bool(_exits.get('N', false)),
			'E': bool(_exits.get('E', false)),
			'S': bool(_exits.get('S', false)),
			'W': bool(_exits.get('W', false)),
		}
	is_empty = not (exits['N'] or exits['E'] or exits['S'] or exits['W'])


func has_any_exit() -> bool:
	return exits['N'] or exits['E'] or exits['S'] or exits['W']

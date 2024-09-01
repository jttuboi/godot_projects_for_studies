class_name ItemData
extends Resource

export (int) var id = -1
export (int) var qn = 0
export (int) var ql = 1


func _to_string():
	return "(id:"+str(id)+",ql:"+str(ql)+",qn:"+str(qn)+")"

extends Node

var main_node setget , _get_main_node
var width_screen setget , _get_width_screen
var height_screen setget , _get_height_screen
var mouse_position setget , _get_mouse_position



func _get_main_node():
	var root = get_tree().get_root()
	return root.get_child(root.get_child_count() - 1)


func _get_width_screen():
	return get_tree().root.get_visible_rect().size.x


func _get_height_screen():
	return get_tree().root.get_visible_rect().size.y


func _get_mouse_position():
	return get_viewport().get_mouse_position()


func create_timer(wait_time):
	var timer = Timer.new()
	timer.set_wait_time(wait_time)
	timer.set_one_shot(true)
	
	# o signal timeout sera conectado com o timer2, ou seja, 
	# quando timer1 dizer timeout, o timer2 executara o queue_free.
	# jah que timer1 e timer2 sao os mesmos,
	# entao ele executara o proprio queue_free quando terminar o tempo
	timer.connect("timeout", timer, "queue_free")
	add_child(timer)
	timer.start()
	return timer


func choose(choices):
	randomize()
	var rand_index = randi() % choices.size()
	return choices[rand_index]


func remote_call(src_node, method, arg0 = null, arg1 = null):
	src_node = find_node2(src_node)

	if src_node and src_node.has_method(method):
		if arg0 and arg1:
			return src_node.call(method, arg0, arg1)
		if arg0:
			return src_node.call(method, arg0)
		
		return src_node.call(method)


func attach(src_node, src_signal, trg_node, trg_func):
	if typeof(src_node) == TYPE_STRING:
		src_node = find_node2(src_node)

	if typeof(trg_node) == TYPE_STRING:
		trg_node = find_node2(trg_node)

	if src_node != null and trg_node != null:
		src_node.connect(src_signal, trg_node, trg_func)


func find_node2(node):
	return self.main_node.find_node(node)
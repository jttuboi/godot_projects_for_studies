class_name Food
extends Area

const SPIN_SPEED = 180

export(NodePath) onready var food_mesh = get_node(food_mesh) as Spatial
export(String) var food_name = ''


func _ready():
	Signals.connect('food_moused_over', self, 'on_mouse_entered')
	Signals.connect('food_moused_out', self, 'on_mouse_out')
	Signals.connect('food_clicked', self, 'on_mouse_clicked')
	set_process(false)


func _process(delta):
	food_mesh.rotation_degrees.y += SPIN_SPEED * delta


func on_mouse_entered(food: Food):
	if food == self:
		$SpotLight.visible = true
		set_process(true)


func on_mouse_out():
	$SpotLight.visible = false
	set_process(false)
	food_mesh.rotation_degrees.y = 0


func on_mouse_clicked(food: Food):
	if food == self:
		queue_free()
		get_parent().food_chosen(self)

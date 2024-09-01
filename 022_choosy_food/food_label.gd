extends Label

func _ready():
	Signals.connect('food_moused_over', self, 'on_food_hovered')
	Signals.connect('food_moused_out', self, 'on_food_unhovered')


func on_food_hovered(food: Food):
	self.text = food.food_name
	self.visible = true


func on_food_unhovered():
	self.visible = false

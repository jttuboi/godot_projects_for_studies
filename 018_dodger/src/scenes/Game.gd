extends Node2D

var died := false

onready var Baddies := $Baddies
onready var BaddieSpawner := $BaddieSpawner
onready var HUD := $HUD
onready var Player := $Player
onready var GameOverSound := $GameOverSound



func _ready():
	Events.connect("player_has_hit", self, "_on_Events_player_has_hit")
	BaddieSpawner.setup(Baddies, Rect2(0, -50, 500, 50))


func _input(event: InputEvent):
	if died and event.is_action_pressed("ui_accept"):
		BaddieSpawner.restart_spawn()
		HUD.restart_hud()
		Player.restart_position()
		
		if GameOverSound.playing:
			GameOverSound.stop()
		
		_clean_spawner()
		
		died = false


func _clean_spawner():
	for baddie in Baddies.get_children():
		baddie.queue_free()


func _on_Events_player_has_hit():
	if not died:
		GameOverSound.play()
	
	died = true

extends CanvasLayer

var score := 0
var pause_scoring := false

onready var ScoreValue := $ScoreValue
onready var HighScoreValue := $HighScoreValue
onready var LoseMessage := $LoseMessage



func _ready():
	Events.connect("player_has_dodged", self, "_on_Events_player_has_dodged")
	Events.connect("player_has_hit", self, "_on_Events_player_has_hit")
	LoseMessage.hide()


func restart_hud():
	# reset score
	score = 0
	ScoreValue.text = "0"
	
	pause_scoring = false
	LoseMessage.hide()
	

func _on_Events_player_has_dodged():
	if not pause_scoring:
		score += 1
		ScoreValue.text = str(score)


func _on_Events_player_has_hit():
	if score > int(HighScoreValue.text):
		HighScoreValue.text = ScoreValue.text
	
	pause_scoring = true
	LoseMessage.show()

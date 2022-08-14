extends Node

var coins_collected : int = 0
var tracks = [
	{"name": "One", "scene": "1.tscn"},
	{"name": "Two", "scene": "1.tscn"}
]

func _ready():
	GameEvents.connect("coin_collected", self, "_on_coin_collected")
	
func _on_coin_collected():
	coins_collected += 1

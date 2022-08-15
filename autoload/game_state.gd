extends Node

var coins_collected : int = 0
var tracks = [
	{"name": "One", "scene": "1.tscn"},
	{"name": "Two", "scene": "1.tscn"}
]

var current_marble_mesh = load("res://marbles/blue_with_fresnel.tres")

func _ready():
	GameEvents.connect("coin_collected", self, "_on_coin_collected")
	
func _on_coin_collected():
	coins_collected += 1

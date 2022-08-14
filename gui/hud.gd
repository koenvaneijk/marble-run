extends Control

func _ready():
	hide()
	
	GameEvents.connect("coin_collected", self, "_on_coin_collected")
	GameEvents.connect("ui_requested_start_run", self, "_on_start_run")
	
func _on_start_run():
	show()

func _on_coin_collected():
	$ScoreLabel.text = "%s" % GameState.coins_collected

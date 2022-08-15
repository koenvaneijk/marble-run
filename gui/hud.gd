extends Control

func _ready():
	hide()
	
	GameEvents.connect("coin_collected", self, "_on_coin_collected")
	
	GameEvents.connect("run_started", self, "_on_run_started")
	GameEvents.connect("run_ended", self, "_on_run_ended")
	
func _on_run_started():
	show()

func _on_run_ended(_seconds):
	hide()

func _on_coin_collected():
	$ScoreLabel.text = "%s" % GameState.coins_collected

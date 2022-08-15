extends Control

func _ready():
	hide()
	
	GameEvents.connect("run_ended", self, "_on_run_ended")

func _on_run_ended(seconds):
	show()
	
	$TimeLabel.text = "%s seconds" % int(seconds)


func _on_SelectTrackScreenButton_button_up():
	hide()
	
	GameEvents.emit_signal("ui_requested_select_track_screen")

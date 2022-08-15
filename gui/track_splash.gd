extends Control

func _ready():
	hide()
	
	GameEvents.connect("ui_requested_load_track", self, "_on_load_track")
	
func _on_load_track(_index):
	show()

func _on_StartRunButton_button_up():
	GameEvents.emit_signal("ui_requested_start_run")
	hide()

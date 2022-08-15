extends Control

func _ready():
	hide()
	
	GameEvents.connect("ui_requested_load_track", self, "_on_load_track")
	
func _on_load_track(_index):
	show()

func _on_StartRunButton_button_up():
	GameEvents.emit_signal("ui_requested_start_run")
	hide()


func _on_PreviousMarbleButton_button_up():
	GameEvents.emit_signal("ui_requested_previous_marble")


func _on_NextMarbleButton_button_up():
	GameEvents.emit_signal("ui_requested_next_marble")

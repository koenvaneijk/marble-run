extends Control

func _ready():
	for track in GameState.tracks:
		$TrackList.add_item(track.name)
		
	GameEvents.connect("ui_requested_select_track_screen", self, "show")

func _on_TrackList_item_selected(index):
	GameEvents.emit_signal("ui_requested_load_track", index)
	hide()


func _on_NextEnvironmentButton_button_up():
	GameEvents.emit_signal("ui_requested_next_environment")


func _on_PreviousEnvironmentButton_button_up():
	GameEvents.emit_signal("ui_requested_previous_environment")

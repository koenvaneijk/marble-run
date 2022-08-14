extends Control

func _ready():
	for track in GameState.tracks:
		$TrackList.add_item(track.name)

	GameEvents.connect("finish_reached", self, "_on_finish_reached")

func _on_TrackList_item_selected(index):
	GameEvents.emit_signal("ui_requested_load_track", index)
	hide()

func _on_finish_reached():
	show()

extends Spatial

export(PackedScene) var player_scene

var track
var marble

func _ready():
	GameEvents.connect("ui_requested_load_track", self, "load_track")
	GameEvents.connect("ui_requested_start_run", self, "start_run")
	
	GameEvents.connect("finish_reached", self, "_on_finish_reached")

func load_track(index):
	# Load track
	var track_scene = load("res://tracks/%s" % GameState.tracks[index]["scene"])
	track = track_scene.instance()
	$World.add_child(track)
	
	# Spawn marble
	marble = player_scene.instance()
	$World.add_child(marble)

	# Show start button
	
func start_run():
	# Start timer
	GameEvents.emit_signal("run_started")
	
func _on_finish_reached():
	marble.queue_free()
	track.queue_free()

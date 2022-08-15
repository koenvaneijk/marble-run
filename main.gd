extends Spatial

export(PackedScene) var player_scene
export(Array, Resource) var environments
export(Array, Resource) var marbles

var track
var marble
var run_ongoing = false

onready var track_timer = $TrackTimer
onready var camera_rig = $CameraRig

func _ready():
	GameEvents.connect("ui_requested_load_track", self, "load_track")
	GameEvents.connect("ui_requested_start_run", self, "start_run")
	GameEvents.connect("ui_requested_select_track_screen", self, "_on_ui_requested_select_track_screen")
	GameEvents.connect("ui_requested_next_environment", self, "_on_ui_requested_next_environment")
	GameEvents.connect("ui_requested_previous_environment", self, "_on_ui_requested_previous_environment")		
	GameEvents.connect("ui_requested_next_marble", self, "_on_ui_requested_next_marble")
	GameEvents.connect("ui_requested_previous_marble", self, "_on_ui_requested_previous_marble")

	GameEvents.connect("finish_reached", self, "end_run")

	camera_rig.set_as_toplevel(true)

func _on_ui_requested_next_environment():
	$WorldEnvironment.environment = environments[1]
	
func _on_ui_requested_previous_environment():
	$WorldEnvironment.environment = environments[0]
	
func _on_ui_requested_next_marble():
	GameState.current_marble_mesh = marbles[0]

func _on_ui_requested_previous_marble():
	GameState.current_marble_mesh= marbles[1]
	
func load_track(index):
	# Load track
	var track_scene = load("res://tracks/%s" % GameState.tracks[index]["scene"])
	track = track_scene.instance()
	add_child(track)
	
func start_run():
	run_ongoing = true
	
	# Spawn marble
	marble = player_scene.instance()
	add_child(marble)

	# Start timer
	track_timer.start()
	
	GameEvents.emit_signal("run_started")
	
func end_run():
	run_ongoing = false
	
	var seconds = 10000 - track_timer.time_left
	track_timer.stop()
	
	GameEvents.emit_signal("run_ended", seconds)

func _on_ui_requested_select_track_screen():
	if marble:
		marble.queue_free()
		
	if track:
		track.queue_free()

func _physics_process(_delta):
	if run_ongoing:
		if marble:
			camera_rig.global_transform.origin = lerp(camera_rig.global_transform.origin, marble.global_transform.origin, 0.9)

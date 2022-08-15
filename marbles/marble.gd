extends RigidBody

export var speed_multiplier = 1.0

var active = true

func _ready():
	GameEvents.connect("run_started", self, "_on_run_started")
	GameEvents.connect("run_ended", self, "_on_run_ended")

func _on_run_started():
	active = true
	
func _on_run_ended(_seconds):
	active = false # Disable inputs

func _on_SwipeDetector_swiped(direction):
	if active:
		apply_central_impulse(Vector3(direction.x, 0, direction.y)*speed_multiplier)


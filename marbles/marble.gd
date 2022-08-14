extends RigidBody

export var speed_multiplier = 1.0

var active = true

func _ready():
	$CameraRig.set_as_toplevel(true)
	
	GameEvents.connect("run_started", self, "_on_run_started")
	GameEvents.connect("finish_reached", self, "_on_finish_reached")

func _on_run_started():
	active = true
	
func _on_finish_reached():
	active = false # Disable inputs

func _on_SwipeDetector_swiped(direction):
	if active:
		apply_central_impulse(Vector3(direction.x, 0, direction.y)*speed_multiplier)

func _physics_process(delta):
	camera_follows_player()

func camera_follows_player():
	$CameraRig.global_transform.origin = global_transform.origin

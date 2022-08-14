extends Area


func _on_Finish_body_entered(body):
	if body.name == "Marble":
		# GameEvents.emit_signal("finish_reached")
		$CPUParticles.emitting = true
		$AudioStreamPlayer.play()

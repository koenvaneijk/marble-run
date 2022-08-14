extends Area

func _on_Coin_body_entered(body):
	if body.name == "Marble":
		$AnimationPlayer.play("Collect")
		$AudioStreamPlayer.play()
		GameEvents.emit_signal("coin_collected")

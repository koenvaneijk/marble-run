extends Node

signal swiped(direction)

export(float, 1.0, 1.5) var MAX_DIAGONAL_SLOPE = 1.3

var swipe_start_position = Vector2()
var swiping = false

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			_swipe_start(event.position)
		else:
			_swipe_end(event.position)

func _swipe_start(position):
	swipe_start_position = position
	swiping = true
	
func _swipe_end(position):
	var direction = (position - swipe_start_position).normalized()
	emit_signal("swiped", direction)

extends ColorRect

var started = false

func start():
	started = true
	$"../../player/audio/explosion".play()

func _process(delta: float) -> void:
	if started:
		color.a = min(color.a + (10*delta), 255)

extends Label

func _ready() -> void:
	$Timer.start(600)

func _process(delta: float) -> void:
	text = "Time: " + str(int($Timer.time_left))

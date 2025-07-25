extends Label

func _ready() -> void:
	#$Timer.start(600)
	$Timer.start(300)

func _process(delta: float) -> void:
	text = "Time: " + str(int($Timer.time_left))


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

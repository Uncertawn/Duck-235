extends PlayerState
class_name PlayerMove

func Enter():
	pass

func Physics_Process(delta: float):
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	if Input.is_action_just_pressed("dash") and direction:
		Transitioned.emit(self, "dash")
	
	controller.move(delta, direction)

func Exit():
	pass

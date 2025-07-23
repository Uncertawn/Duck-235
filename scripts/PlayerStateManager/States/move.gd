extends PlayerState
class_name PlayerMove

func Enter():
	$"../../AnimatedSprite2D".play("walk")

func Physics_Process(delta: float):
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	if Input.is_action_just_pressed("dash") and direction:
		Transitioned.emit(self, "dash")
	
	controller.move(delta, direction)
	
	if direction.x == 0 and direction.y == 0:
		Transitioned.emit(self, "idle")

func Exit():
	$"../../AnimatedSprite2D".play("idle")

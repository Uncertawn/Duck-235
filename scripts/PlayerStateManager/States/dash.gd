extends PlayerState
class_name PlayerDash

const dash_factor := 100000
const SLOWDOWN_SPEED := dash_factor/10

var should_slow_down := false

func Enter():
	should_slow_down = false

func Physics_Process(delta: float):
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	if !should_slow_down:
		#for i in range(10):
			#controller.global_position += direction * 10
		controller.velocity += direction * dash_factor * delta
		should_slow_down = true
	else:
		controller.velocity.x = move_toward(controller.velocity.x, 0, SLOWDOWN_SPEED*delta)
		controller.velocity.y = move_toward(controller.velocity.y, 0, SLOWDOWN_SPEED*delta)
	
	if controller.velocity.length() < 15:
		Transitioned.emit(self, "move")

func Exit():
	pass

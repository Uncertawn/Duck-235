extends PlayerState
class_name PlayerIdle

const dash_factor := 100000
const SLOWDOWN_SPEED := dash_factor/10

var should_slow_down := false

func Enter():
	$"../../AnimatedSprite2D".play("idle")

func Physics_Process(delta: float):
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	
	controller.apply_friction(delta, 0)
	controller.apply_friction(delta, 1)
	
	if direction.x != 0 or direction.y != 0:
		Transitioned.emit(self, "move")

func Exit():
	pass

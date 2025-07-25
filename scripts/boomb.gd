extends Sprite2D


@export var move:=true

var speed_up_speed := 35.0
var speed := 0.0

var started := false

func start():
	started = true

func _physics_process(delta: float) -> void:
	if started:
		speed += speed_up_speed * delta
		speed = min(500.0, speed)
		global_position.y -= speed * delta
		
		if global_position.y < -2000:
			queue_free()

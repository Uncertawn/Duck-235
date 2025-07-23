extends CharacterBody2D

const SPEED := 500.0/2.0
const SLOWDOWN_SPEED := SPEED*4

var facing = 1

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta: float) -> void:
	if facing == 1:
		$AnimatedSprite2D.flip_h = true
	elif facing == -1:
		$AnimatedSprite2D.flip_h = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	move_and_slide()

func move(delta, direction):
	if direction.x > 0:
		facing = 1
	elif direction.x < 0:
		facing = -1
	
	if direction.x != 0:
		velocity.x = direction.x * SPEED
	else:
		apply_friction(delta, 0)
	
	if direction.y != 0:
		velocity.y = direction.y * SPEED
	else:
		apply_friction(delta, 1)

func apply_friction(delta, axis:int=0):
	if axis == 0:
		velocity.x = move_toward(velocity.x, 0, SLOWDOWN_SPEED * delta)
	elif axis == 1:
		velocity.y = move_toward(velocity.y, 0, SLOWDOWN_SPEED * delta)
		

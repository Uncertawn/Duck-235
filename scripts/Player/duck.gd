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
		
	if Input.is_action_just_pressed("interact"):
		if len(interactables) > 0:
			interactables[-1].interact()
	if Input.is_action_pressed("interact"):
		$interaction_box/interact_button.frame = 1
	else:
		$interaction_box/interact_button.frame = 0

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
		

var interactables = []

func _on_interaction_box_body_entered(body: Node2D) -> void:
	pass

func _on_interaction_box_body_exited(body: Node2D) -> void:
	pass

func _on_interaction_box_area_entered(area: Area2D) -> void:
	if area.has_method("interact"):
		for interactable in interactables:
			if interactable.has_method("highlight"):
				interactable.highlight(0)
		interactables.append(area)
		if area.has_method("highlight"):
			area.highlight(1)
		
		if area.has_method("get_interact_message"):
			$interaction_box/interact_button/text.text = area.get_interact_message()
		$interaction_box/interact_button.visible = true

func _on_interaction_box_area_exited(area: Area2D) -> void:
	if area.has_method("interact"):
		if interactables.has(area):
			if area.has_method("highlight"):
				area.highlight(0)
			interactables.remove_at(interactables.find(area))
			if len(interactables) == 0:
				$interaction_box/interact_button.visible = false
			if len(interactables) > 0:
				if interactables[-1].has_method("highlight"):
					interactables[-1].highlight(-1)

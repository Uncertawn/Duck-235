extends Node
class_name PlayerStateManager

@export var initial_state: PlayerState
@export var current_state: PlayerState
var states: Dictionary = {}

@export var controller : CharacterBody2D

func _ready() -> void:
	for child:PlayerState in get_children():
		child.Transitioned.connect(on_transition_state)
		child.controller = controller
		states[child.name.to_lower()] = child
	
	if initial_state != null:
		current_state = initial_state
		current_state.Enter()
	else:
		current_state = states[states.keys()[0]]

func _process(delta: float) -> void:
	current_state.Process(delta)

func _physics_process(delta: float) -> void:
	current_state.Physics_Process(delta)

func on_transition_state(state, new_state):
	if state != current_state:return
	if current_state: current_state.Exit()
	
	var new_state_ = states[new_state.to_lower()]
	new_state_.Enter()
	current_state = new_state_

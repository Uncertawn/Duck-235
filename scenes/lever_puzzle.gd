extends Node2D
class_name LeverPuzzleMaster

@export var total_puzzle_master: TotalPuzzleMaster
@export var lever_holder: Node2D
var levers: Array[Lever]
@export var pattern: Array[bool]
@export var bulb:Bulb

var solved := false

func _ready() -> void:
	for child in lever_holder.get_children():
		levers.append(child)
	for lever in levers:
		lever.puzzle_master = self
		lever.update()

func _process(delta: float) -> void:
	pass

func update():
	var lever_pattern = []
	for lever in levers:
		lever_pattern.append(lever.on)
	#print(str(lever_pattern) + " " + str(pattern))
	if lever_pattern == pattern:
		bulb.set_on(true)
		solved = true
	else:
		bulb.set_on(false)
		solved = false
	if total_puzzle_master:
		total_puzzle_master.update()

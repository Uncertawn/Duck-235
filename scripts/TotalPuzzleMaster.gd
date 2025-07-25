extends Node2D
class_name TotalPuzzleMaster

@export var puzzle_holder: Node2D
@export var bulb_holder: Node2D
@export var reward_spawn: Node2D
@export var reward: Item
var puzzle_masters: Array[LeverPuzzleMaster]
var bulbs: Array[Bulb]

var done := false

func _ready() -> void:
	for child in puzzle_holder.get_children():
		child.total_puzzle_master = self
		puzzle_masters.append(child)
	for child in bulb_holder.get_children():
		bulbs.append(child)
	
	update()

func update():
	var flag := true
	for pm in puzzle_masters:
		if not pm.solved:
			flag = false
	done = flag
	if done:
		reward_spawn.visible = true
		reward.global_position = reward_spawn.global_position
	
	for i in range(len(bulbs)):
		bulbs[i].set_on(puzzle_masters[i].solved)
	
	

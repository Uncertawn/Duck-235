extends Node2D
class_name Lever

@export var on := false
@export var display:Sprite2D
@export var audio:AudioStreamPlayer2D

@export var puzzle_master:LeverPuzzleMaster

func update():
	if on:
		display.frame = 1
	else:
		display.frame = 0
	puzzle_master.update()

func interact():
	on = not on
	update()
	audio.play()
	

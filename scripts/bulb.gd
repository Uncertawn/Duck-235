extends Node2D
class_name Bulb

@export var display:Sprite2D
@export var on:=false

func _ready() -> void:
	update()

func toggle():
	on = not on
	update()

func set_on(on_:bool=false):
	on = on_
	update()

func update():
	if on:
		display.frame = 1
	else:
		display.frame = 0

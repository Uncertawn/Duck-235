extends Node2D

@export var sprite:Sprite2D

var is_open := false

func open():
	sprite.frame = 0

func close():
	sprite.frame = 1

func interact():
	is_open = not is_open
	if is_open: open()
	elif not is_open: close()
	print(str(is_open) + " " + str(sprite.frame))
	

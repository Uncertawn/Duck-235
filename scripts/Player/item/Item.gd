extends Node2D
class_name Item

@export var inventory:Inventory
@export var display:Sprite2D
@export var item_name:String

@export var audio:AudioStreamPlayer2D

func interact():
	if not inventory.is_full():
		inventory.set_item(self)
		queue_free()
		audio.play()

func is_item():
	return true

extends Node2D
class_name Item

@export var inventory:Inventory
@export var display:Sprite2D
@export var item_name:String

func interact():
	if not inventory.is_full():
		inventory.set_item(self)
		queue_free()

func is_item():
	return true

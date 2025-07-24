extends Sprite2D
class_name Inventory

@export var item_display: Sprite2D
@export var item:Item

func set_item(item_:Item):
	item = item_
	item_display.texture = item.display.texture
	

extends Sprite2D
class_name Inventory

@export var item_display: Sprite2D
@export var item:Array[String]

func set_item(item_:Item):
	item.append(item_.item_name)
	item_display.texture = item_.display.texture

func is_full():
	if len(item)>0:
		return true
	else:
		return false

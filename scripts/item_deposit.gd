extends Node2D

@export var u235 := false
@export var metal_sheet := false
@export var thruster := false
@export var fuel := false

@export var inv:Inventory

func interact():
	if len(inv.item) > 0:
		if "u235" in inv.item[0].to_lower():
			u235 = true
		elif "metal" in inv.item[0].to_lower() and "sheet" in inv.item[0].to_lower():
			metal_sheet = true
		elif "thruster" in inv.item[0].to_lower():
			thruster = true
		elif "fuel" in inv.item[0].to_lower():
			fuel = true
		inv.item.pop_at(0)
		inv.item_display.texture = null
	update()
	
func update():
	if u235:
		$u235.frame = 0 + 4
	if metal_sheet:
		$"metal-sheet".frame = 1 + 4
	if thruster:
		$thruster.frame = 2 + 4
	if fuel:
		$fuel.frame = 3 + 4

extends Node2D

@export var sprite:Sprite2D
@export var item_deposit:ItemDeposit
@export var flash:ColorRect

var is_open := false

func open():
	sprite.frame = 0

func close():
	sprite.frame = 1

func interact():
	is_open = not is_open
	#if is_open:
	if is_open and item_deposit.is_full():
		open()
		$Boomb.global_position = global_position
		$Boomb.start()
		$flash_after.start()
	elif not is_open: close()
	#print(str(is_open) + " " + str(sprite.frame))
	


func _on_timer_timeout() -> void:
	$"../player/Camera2D/ColorRect".start()
	$to_main_after.start()


func _on_to_main_after_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

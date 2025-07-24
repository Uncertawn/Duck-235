extends Area2D

@export var sprite: Sprite2D
@export var interact_holder:Node2D

func highlight(on:int = 1):
	if on == 0:
		sprite.material.set_shader_parameter("onoff", 0)
	else:
		sprite.material.set_shader_parameter("onoff", 1)

func interact():
	#print("interaction " + sprite.name)
	if interact_holder.has_method("interact"):
		interact_holder.interact()

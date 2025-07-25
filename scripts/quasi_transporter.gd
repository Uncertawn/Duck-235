extends Node2D

@export var player:CharacterBody2D
@export var destination:Node2D
@export var audio:AudioStreamPlayer2D

func interact():
	player.global_position = destination.global_position
	audio.play()

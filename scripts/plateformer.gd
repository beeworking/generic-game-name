
extends Node2D

var player = preload("res://scenes/player.tscn").instance()

func _ready():
	add_child(player)

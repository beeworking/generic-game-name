
extends Node2D

var player = preload("player.tscn").instance()

func _ready():
	add_child(player)
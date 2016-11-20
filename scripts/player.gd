extends "res://scripts/controlled_entity.gd"

func _fixed_process(delta):
	movements(delta)

func _ready():
	set_fixed_process(true)


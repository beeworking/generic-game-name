
extends Node2D

const SPEED = 150

onready var player = get_node("player")
onready var screen_size = get_viewport_rect().size

func _process(delta):
	move(Vector2(0, 1))
	var pos = player.get_pos()
	
	if (pos.y > 0 and Input.is_action_pressed("ui_up")):
	    pos.y += -SPEED * delta
	if (pos.y < screen_size.y and Input.is_action_pressed("ui_down")):
	    pos.y += SPEED * delta
	
	if (pos.x > 0 and Input.is_action_pressed("ui_right")):
	    pos.x += SPEED * delta
	if (pos.x < screen_size.x and Input.is_action_pressed("ui_left")):
	    pos.x += -SPEED * delta
	
	player.set_pos(pos)

func _ready():
	set_process(true)


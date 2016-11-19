extends Panel

func _on_button_pressed():
	get_tree().change_scene("res://scenes/map.tscn")

func _ready():

	get_node("start_game_button").connect("pressed",self,"_on_button_pressed")

extends "res://scripts/controlled_entity.gd"

func _fixed_process(delta):
	velocity.y += delta * gravity

	if (Input.is_action_pressed("ui_up")):
		velocity.y -= 10
	if (Input.is_action_pressed("ui_left")):
		velocity.x = - walk_speed
	elif (Input.is_action_pressed("ui_right")):
		velocity.x =   walk_speed
	else:
		velocity.x = 0
	var motion = velocity * delta
	motion = move(motion)

	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)

func _ready():
	set_fixed_process(true)


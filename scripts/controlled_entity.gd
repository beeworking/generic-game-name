extends KinematicBody2D

export var gravity 						= 200.0
export var walk_speed					= 200
export var up_motion_input 		= "ui_up"
export var down_motion_input 	= "ui_down"
export var left_motion_input 	= "ui_left"
export var right_motion_input	= "ui_right"

onready var velocity		= Vector2()

func movements(delta):
	velocity.y += delta * gravity

	if (Input.is_action_pressed(up_motion_input)):
		velocity.y -= 10
	if (Input.is_action_pressed(left_motion_input)):
		velocity.x = - walk_speed
	elif (Input.is_action_pressed(right_motion_input)):
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
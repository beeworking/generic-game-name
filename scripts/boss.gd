extends KinematicBody2D

const GRAVITY 		= 5.0
const WALK_SPEED 	= 200

onready var velocity		= Vector2()

func _fixed_process(delta):
	velocity.y += delta * GRAVITY

	if (Input.is_action_pressed("boss_up")):
		velocity.y -= 10
	if (Input.is_action_pressed("boss_left")):
		velocity.x = - WALK_SPEED
	elif (Input.is_action_pressed("boss_right")):
		velocity.x =   WALK_SPEED
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


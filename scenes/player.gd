extends CharacterBody2D


const SPEED = 240.0
const ACCEL = 30.0
const JUMP_VELOCITY = -400.0

var health = 10

var canopy_count = 0;

signal hide_object

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if direction:
		velocity += direction * ACCEL
	
	velocity.x *= 0.92
	velocity.y *= 0.9
	velocity = velocity.limit_length(SPEED)

	move_and_slide()
	

#func hurt

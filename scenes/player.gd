extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var health = 10

var canopy_count = 0;

signal hide_object

func _physics_process(delta: float) -> void:

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

#func hurt



func _on_area_2d_area_entered(area: Area2D) -> void	:
	canopy_count += 1;
	var hidden_opacity = 1/(3 * max(float(canopy_count), 1))
	var object : Node2D = area.get_parent()
	var opacity_tween = object.create_tween()
	opacity_tween.tween_property(object, "modulate", Color(Color.WHITE, hidden_opacity), 0.5)



func _on_area_2d_area_exited(area: Area2D) -> void:
	canopy_count = max(canopy_count - 1, 0);
	var object : Node2D = area.get_parent()
	var opacity_tween = object.create_tween()
	opacity_tween.tween_property(object, "modulate", Color(Color.WHITE, 1), 0.5)

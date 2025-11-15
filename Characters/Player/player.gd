extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var arm: Node2D = $Arm
@onready var body: Sprite2D = $Body


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if velocity.y < 0:
			velocity += get_gravity() * delta * 0.8
		else:
			velocity += get_gravity() * delta


	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func _process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	arm.look_at(mouse_position)
	if mouse_position.x > position.x:
		body.scale.x = 1.0
		arm.scale.y = 1.0
	else:
		body.scale.x = -1
		arm.scale.y = -1

	move_and_slide()

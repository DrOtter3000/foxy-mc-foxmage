class_name Enemy
extends CharacterBody2D

@export var health := 2.0
@export var speed := 100


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func take_damage(damage) -> void:
	health -= damage
	if health <= 0:
		die()

func die() -> void:
	queue_free()

class_name Enemy
extends CharacterBody2D

@export var health := 2.0
@export var speed := 100
@export var direction := 1 # 1 == left, -1 == right


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = speed * direction
	move_and_slide()

func take_damage(damage) -> void:
	health -= damage
	if health <= 0:
		die()

func die() -> void:
	queue_free()

func switch_direction(_body) -> void:
	direction *= -1

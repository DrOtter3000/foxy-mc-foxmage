class_name Enemy
extends CharacterBody2D

@export var health := 2.0
@export var speed := 100
@export var dir := -1 # 1 == left, -1 == right
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	print(dir)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = speed * dir
	move_and_slide()

func take_damage(damage) -> void:
	health -= damage
	if health <= 0:
		die()

func die() -> void:
	queue_free()

func switch_direction(_body) -> void:
	dir *= -1
	sprite.scale.x *= -1

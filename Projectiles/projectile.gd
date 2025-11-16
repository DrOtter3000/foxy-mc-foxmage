extends Area2D

@export var speed := 750
@export var explosion: PackedScene

@onready var player_detection_timer: Timer = $PlayerDetectionTimer

var direction: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Vector2.RIGHT.rotated(rotation)
	global_position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	var explosion_instance = explosion.instantiate()
	get_parent().call_deferred("add_child", explosion_instance)
	explosion_instance.global_position = global_position
	queue_free()

func _on_player_detection_timer_timeout() -> void:
	print("hi")
	set_collision_mask_value(2, 2)

extends Area2D

@onready var gpu_particles: GPUParticles2D = $GPUParticles2D

var damage := 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gpu_particles.emitting = true

func _on_timer_timeout() -> void:
	monitoring = true

func deal_damage(body) -> void:
	body.take_damage(damage)

func _on_body_entered(body: Node2D) -> void:
	deal_damage(body)

func _on_gpu_particles_2d_finished() -> void:
	queue_free()

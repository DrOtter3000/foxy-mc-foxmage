extends Area2D

@onready var gpu_particles: GPUParticles2D = $GPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gpu_particles.emitting = true

func _process(delta: float) -> void:
	pass

extends Sprite2D

@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation.play('idle')

func _on_body_collision_area_entered(area:Area2D) -> void:
	queue_free()

extends Node2D

@onready var animation: AnimationPlayer = $Sprite2D/AnimationPlayer

func _ready() -> void:
	animation.play('idle')

extends CharacterBody2D
class_name Present

@export var max_force = 0.0
@export var initialDirection = Vector2.ZERO

@export var speed = Vector2(10, 10)
@export var gravity = 200

func set_force_and_direction(force: float, direction: Vector2):
	self.max_force = force
	self.initialDirection = direction

func _ready() -> void:
	speed.y *= max_force
	speed.x *= max_force

func _physics_process(delta: float) -> void:
	if (speed.y > -gravity):
		speed.y -= 1

	velocity = speed * initialDirection
	move_and_slide()

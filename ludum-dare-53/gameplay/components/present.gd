extends CharacterBody2D
class_name Present

@export var max_force = 0.0
@export var initialDirection = Vector2.ZERO

@export var speed = Vector2(10, 10)
@export var gravity = 3000

func set_force_and_direction(force: float, direction: Vector2):
	self.max_force = force
	self.initialDirection = direction

func _ready() -> void:
	speed.y *= speed.y * max_force * initialDirection.y
	speed.x *= speed.x * max_force
	velocity.y = speed.y

func _physics_process(delta: float) -> void:
	
	velocity.y += gravity * delta* 3
	velocity.x = speed.x
	move_and_slide()

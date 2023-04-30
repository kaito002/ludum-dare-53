extends CharacterBody2D
class_name Present

@export var max_force = 0.0
@export var initialDirection = Vector2.ZERO

@export var speed = Vector2(10, 10)
@export var gravity = 3000

signal on_score(points: int)

func set_force_and_direction(force: float, direction: Vector2):
	self.max_force = force
	self.initialDirection = direction

func _ready() -> void:
	speed.y *= speed.y * max_force * initialDirection.y
	speed.x *= speed.x * max_force
	velocity.y = speed.y

func _physics_process(delta: float) -> void:
	if (velocity.y == 0 && velocity.x < 2):
		queue_free()
		emit_signal('on_score', 0)
	speed.x = speed.x - (speed.x * 0.2 * delta)
	velocity.y += gravity * delta* 3
	velocity.x = speed.x
	move_and_slide()


func _on_bad_kids_collision_area_entered(area:Area2D) -> void:
	emit_signal('on_score', 100)
	queue_free()


func _on_good_kids_collision_area_entered(area:Area2D) -> void:
	emit_signal('on_score', -100)
	queue_free()


func _on_good_kid_head(area:Area2D) -> void:
	velocity.y = -200

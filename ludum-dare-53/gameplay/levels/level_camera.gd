extends Camera2D
class_name LevelCamera

var target: Node2D = null

@onready var initial_position = position

func restore_camera():
	zoom = Vector2(1, 1)
	position = initial_position

func follow_smothie(node: Node2D) -> void:
	target = node
	zoom /= 1.5

func _process(_delta: float) -> void:
	if (target != null):
		position.x = target.position.x 
		position.y = target.position.y

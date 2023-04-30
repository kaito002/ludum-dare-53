extends Camera2D
class_name LevelCamera

var target: Node2D = null

func follow_smothie(node: Node2D) -> void:
	target = node
	zoom /= 1.5

func _process(delta: float) -> void:
	if (target != null):
		position.x = target.position.x 
		position.y = target.position.y

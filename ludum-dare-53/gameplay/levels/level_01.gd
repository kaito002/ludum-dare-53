extends Screen


@onready var camera: LevelCamera = $Camera2D
@onready var cannon = $Cannon

func _ready() -> void:
	cannon.connect('present_fired', _on_present_fired)

func _on_present_fired(node: Node2D):
	camera.follow_smothie(node)
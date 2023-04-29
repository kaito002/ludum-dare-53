extends Sprite2D

@export_category("Cannon Angle")
@export var min_angle = 10
@export var max_angle = -45

@onready var current_angle = min_angle


func _process(_delta: float) -> void:
	var angle = get_angle_to(get_global_mouse_position())
	
	if (angle < max_angle || angle > min_angle): return
	
	look_at(get_global_mouse_position())
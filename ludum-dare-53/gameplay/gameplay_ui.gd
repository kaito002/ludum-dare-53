extends Control

@onready var _pause_menu: Control = $PauseMenu

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed('pause_menu'):
		if _pause_menu.is_visible_in_tree():
			_pause_menu.hide()
		else:
			_pause_menu.show()
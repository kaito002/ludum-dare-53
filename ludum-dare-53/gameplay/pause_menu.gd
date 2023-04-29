extends Control


func _on_back_to_menu_btn_pressed() -> void:
	AppNavigator.replace(preload('res://ludum-dare-53/start_menu_screen/start_menu_screen.tscn').instantiate())


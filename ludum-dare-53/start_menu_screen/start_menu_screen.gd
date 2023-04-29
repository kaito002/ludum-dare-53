extends Screen
class_name StartMenuScreen


func _on_credits_btn_pressed() -> void:
	AppNavigator.push(preload('res://ludum-dare-53/credits_screen/credits_screen.tscn')
			.instantiate())
	
func _on_start_btn_pressed() -> void:
	AppNavigator.replace(preload('res://ludum-dare-53/gameplay/gameplay.tscn').instantiate())

extends Screen
class_name SplashScreen


func _ready() -> void:
	$Timer.start()

func _on_timer_timeout() -> void: #connected to $Timer
	AppNavigator.replace(preload('res://ludum-dare-53/start_menu_screen/start_menu_screen.tscn').instantiate())

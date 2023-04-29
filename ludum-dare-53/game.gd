extends Node2D

func _ready() -> void:
	var splashScene = preload('res://ludum-dare-53/splash_screen/splash_screen.tscn').instantiate()
	AppNavigator.push(splashScene)

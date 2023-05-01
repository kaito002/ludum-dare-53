extends Screen


@onready var camera: LevelCamera = $Camera2D
@onready var cannon: Cannon = $Cannon
@onready var poinst_bar: PoinstBar = $CanvasLayer/GUI/ColorRect/PointsBar
@onready var poinst_label: Label = $CanvasLayer/GUI/Points
@onready var total_presents_counter: Label = $CanvasLayer/GUI/Panel/TotalPresentsCounter
@onready var menu: Control = $CanvasLayer/GUI/Menu
@onready var game_over_message: Control = $CanvasLayer/GUI/Menu/GameOverMessage
@onready var bad_kids_laugh: AudioStreamPlayer2D = $CanvasLayer/BadKidsLaugh
@onready var good_kids_laugh: AudioStreamPlayer2D = $CanvasLayer/GoodKidsLaugh

@export var total_presents: int = 8

var present: Present

func _ready() -> void:
	total_presents_counter.text = "{0}".format([total_presents])
	cannon.connect('present_fired', _on_present_fired)

func _on_present_fired(fired_present: Present):
	total_presents -= 1
	total_presents_counter.text = "{0}".format([total_presents])
	present = fired_present
	camera.follow_smothie(fired_present)
	present.connect('on_score', _on_present_collide)
	present.connect('on_catched', _on_present_catched)


func _process(_delta: float) -> void:
	if (total_presents == 0 && present == null && !menu.visible):
		_finish_game()

func _on_present_collide(points: int):
	play_sound_by_points(points)
	poinst_bar.add_points(points)
	poinst_label.text = "{0}".format([poinst_bar.get_points()])

func _on_present_catched():
	camera.restore_camera()
	cannon.reset()

func _finish_game():
	cannon.lock_shoots()
	menu.visible = true
	if (poinst_bar.get_points() >= poinst_bar.max_value):
		game_over_message.text = "YOU WIN"
		game_over_message.add_theme_color_override('font_color', Color.GREEN)
	else:
		game_over_message.text = "YOU LOSE"
		game_over_message.add_theme_color_override('font_color', Color.RED)

func play_sound_by_points(points):
	if (points == 100):
		bad_kids_laugh.play()
	if (points == -100):
		good_kids_laugh.play()

func _on_back_to_menu_btn_pressed() -> void:
	AppNavigator.replace(preload('res://ludum-dare-53/start_menu_screen/start_menu_screen.tscn').instantiate())


func _on_retry_btn_pressed() -> void:
	AppNavigator.replace(preload('res://ludum-dare-53/gameplay/levels/level_01.tscn').instantiate())

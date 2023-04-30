extends Screen


@onready var camera: LevelCamera = $Camera2D
@onready var cannon: Cannon = $Cannon
@onready var poinst_bar: PoinstBar = $CanvasLayer/GUI/ColorRect/PointsBar
@onready var poinst_label: Label = $CanvasLayer/GUI/Points
@onready var total_presents_counter: Label = $CanvasLayer/GUI/Panel/TotalPresentsCounter

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
	if (total_presents == 0):
		cannon.lock_shoots()

func _on_present_collide(points: int):
	camera.restore_camera()
	cannon.reset()
	poinst_bar.add_points(points)
	poinst_label.text = "{0}".format([poinst_bar.get_points()])

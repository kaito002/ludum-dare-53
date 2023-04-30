extends Node2D

@onready var strength_bar: TextureProgressBar = $StrengthBar
@onready var cannon_barrell = $CannonBarrell
@onready var cannon_output = $CannonBarrell/CannontOutput

@export var rotation_speed: float = 0.5
@export var strength_speed: float = 0.5

@export var min_angle = -45
@export var max_angle = 10

var direction = 1
var lock_cannon = false
var lock_strength = false

var present = preload('res://ludum-dare-53/gameplay/components/present.tscn')

func _process(_delta) -> void:
	if (Input.is_action_just_pressed('lock_cannon') && !lock_cannon):
		lock_cannon = true
		strength_bar.visible = true
	else: if (Input.is_action_just_pressed('lock_cannon') && !lock_strength):
		lock_strength = true
		_fire_present()
	

func _physics_process(delta: float) -> void:
	_determinate_cannon_barrell(delta)
	_calculate_strength(delta)

func _determinate_cannon_barrell(delta: float) -> void:
	if (!lock_cannon):
		cannon_barrell.rotation_degrees += direction * delta * rotation_speed;
		if (cannon_barrell.rotation_degrees < min_angle || cannon_barrell.rotation_degrees > max_angle):
			direction *= -1

func _calculate_strength(_delta: float) -> void:
	if (lock_cannon && !lock_strength):
		strength_bar.value += strength_speed
		if (strength_bar.value == 100 || strength_bar.value == 0):
			strength_speed *= -1

func _fire_present() -> void:
	var p: Present = present.instantiate()
	print("ROTATION: {0}".format([cannon_barrell.rotation_degrees]))
	print("POSITION: {0}".format([cannon_output.position]))
	p.set_force_and_direction(strength_bar.value, Vector2(1, cannon_barrell.rotation_degrees / 100))

	p.position = cannon_output.global_position
	get_tree().root.add_child(p)

extends Node2D
class_name Cannon

@onready var strength_bar: TextureProgressBar = $StrengthBar
@onready var cannon_barrell = $CannonBarrell
@onready var cannon_output = $CannonBarrell/CannontOutput
@onready var shoot_sound: AudioStreamPlayer2D = $ShootSound

@export var rotation_speed: float = 0.5
@export var strength_speed: float = 0.5

@export var min_angle = -45
@export var max_angle = 10

@export var max_strength: = 200

var cannont_shoot = false
var direction = 1
var lock_cannon = false
var lock_strength = false

var present = preload('res://ludum-dare-53/gameplay/components/present.tscn')

signal present_fired(present: Present)

func _ready() -> void:
	strength_bar.max_value = max_strength

func _process(_delta) -> void:
	if (cannont_shoot): return

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
		if (strength_bar.value == max_strength || strength_bar.value == 0):
			strength_speed *= -1

func _fire_present() -> void:
	shoot_sound.play()
	var p: Present = present.instantiate()
	p.scale /= scale
	p.set_force_and_direction(strength_bar.value, Vector2(1, cannon_barrell.rotation_degrees / 100))
	p.position = cannon_output.global_position
	get_tree().root.add_child(p)
	emit_signal('present_fired', p)

func reset():
	lock_cannon = false
	lock_strength = false
	strength_bar.visible = false


func lock_shoots():
	cannont_shoot = true

func unlock_shoots():
	cannont_shoot = false
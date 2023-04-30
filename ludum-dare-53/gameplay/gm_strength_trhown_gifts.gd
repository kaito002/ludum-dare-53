extends Node

var my_strength = 0
var max_strength = 100
var min_strength = 0
var timer = null

func _ready():
	timer = get_node("Timer")
	timer.set_wait_time(3)
	timer.start()

# Si la barra esta presionada se detiene el tempo
func incrase_strength(delta): 
	if Input.is_action_pressed("ui_accept"):
		timer.stop()
		return
		# Incremento fuerza
		my_strength += delta
		if my_strength >= max_strength:
			my_strength = max_strength
			timer.set_wait_time(3)
			timer.set_one_shot(true)
			timer.connect("timeout", self, "decrease_strength") # si pasan los 3 seg se disminuye la force
		else:
				timer.set_wait_time(1)
				timer.start()
				

# Disminuir fuerza
func  decrease_strength():
	my_strength -= 1
	if my_strength <= max_strength:
		my_strength = min_strength
		timer.set_wait_time(3)
		timer.set_one_shot(true)
		timer.connect("timeout", self, "incrase_strength")
	else:
		timer.is_wait_time(1)
		timer.start()
			
		
func stop_timer():
	if Input.is_action_pressed("ui_accept"):
		timer.stop()
		



#func calculate_force ():
#	var mass = 10
#	var acceleration  = 5
#	var force = mass * acceleration
#	return force

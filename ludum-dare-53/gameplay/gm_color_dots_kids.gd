var red_bar = 0
var green_bar = 0

var points_red = 0
var points_green = 0

func update_bar():
 var bar_red_node = get_node("BarRed")
 var bar_green_node = get_node("BarGreen")

 bar_green_node.value = green_bar
 bar_red_node.value = red_bar

 # caída del regalo
func object_falls(container):
    if container == "red":
        # Sumo los puntos y se actualiza barra roja
        points_red += 250
        red_bar += 250
        
        # Bajar la barra verde si la roja supera su valor
        if red_bar > green_bar:
            green_bar -= 150
        
    elif container == "green":
        # Sumar puntos y actualizar la barra verde
        points_green += 150
        green_bar += 150
        
        # Bajar la barra roja si la verde supera su valor
        if green_bar > red_bar:
            red_bar -= 150


    # Actualizar las barras
    update_bar()
    
    # Comprobar si el juego ha terminado
    if red_bar > green:
        print("¡Ganaste! Puntaje final: " + str(points_red + points_green))
    else:
        print("¡Perdiste! Puntaje final: " + str(points_red + points_green))

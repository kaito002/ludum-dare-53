extends Node
class_name StackNavigator

@onready var content: Node = $Content

var _screens: Array[Screen] = []

func push(node: Screen):
	_screens.push_front(node)
	content.add_child(node)
	if _screens.size() > 1:
		var prev_screen: Screen = _screens[1]
		content.remove_child(prev_screen)
	node.on_load()

func replace(node: Screen):
	var current_screen: Screen = _screens.pop_front()
	current_screen.on_kill()
	content.remove_child(current_screen)
	push(node)

func go_back():
	if (_screens.size() <= 1): return
	var current_screen = _screens.pop_front()
	var prev_screen = _screens.front()
	content.add_child(prev_screen)
	current_screen.on_kill()
	content.remove_child(current_screen)

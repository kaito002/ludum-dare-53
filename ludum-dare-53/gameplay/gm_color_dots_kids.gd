extends TextureProgressBar
class_name PoinstBar

var points: int = 0

func add_points(pts: int):
	self.points += pts
	value = self.points

func get_points() -> int:
	return self.points

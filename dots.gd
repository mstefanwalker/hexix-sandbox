extends Node2D


# rendering
export var distance = 6
export var radius = 2.5

var color

# geometry
var start = Vector2(-1, -1)
var dot_positions_per_number = [
	[[],[1],[]],
	[[2],[],[0]],
	[[2],[1],[0]],
	[[0,2],[],[0,2]],
	[[0,2],[1],[0,2]],
	[[0,2],[0,2],[0,2]]
]
var dot_positions


func init(number, color):
	dot_positions = dot_positions_per_number[number]
	self.color = color
	return self


func _draw():
	var y = start.y
	for row in dot_positions:
		for x in row:
			draw_circle(Vector2(x * distance, y * distance), radius, color)
		y += 1

tool
extends Node2D


var hexagon = preload("res://hexagon.tscn")


# rendering
export var distance = 55  # distance between centers of adjacent hexagons
var grid = Vector2(sqrt(3) * distance / 2, distance / 2)  # grid spacing

# geometry
var start = Vector2(0, -5)  # vertical symmetric board, start from center top
var row_counts = [1, 2, 3, 4, 3, 4, 3, 4, 3, 2, 1]  # hexagons per row

# reference store
var hexagons = {}

# state
var base = 25
var digits = 30


func _ready():
	init_board()


func init_board():
	var hex_id = 0
	var y = start.y
	for row_count in row_counts:
		var x_offset = row_count - 1  # how far from center this row starts
		var x = start.x - x_offset
		for n in row_count:
			var hex = hexagon.instance().init(hex_id)
			hexagons[hex_id] = hex
			hex_id += 1
			hex.set_position(Vector2(x * grid.x, y * grid.y))
			add_child(hex)
			x += 2  # rows skip to give room for rows above and below
		y += 1


func get_state():
	var state = 0
	pass


func set_state(state):
	pass



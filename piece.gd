extends Node2D


var dots = preload("res://dots.tscn")


# data
var number = -1  # 0, 1, 2, 3, 4, or 5
var player = -1  # 0 or 1
var type = -1  # 0 or 1

# display
export var player_colors = [Color.blue, Color.red]
export var base_color = Color.white
var current_dots = null


func init(number, player, type):
	self.number = number
	self.player = player
	self.type = type
	set_dots_and_color()
	return self


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and !event.is_pressed():  # release click
		if event.button_index == BUTTON_LEFT:
			increment()
		if event.button_index == BUTTON_RIGHT:
			cycle_color_and_type()
		if event.button_index == BUTTON_MIDDLE:
			queue_free()


func increment():
	number += 1
	number %= 6
	set_dots_and_color()
	

func cycle_color_and_type():
	type += 1
	type %= 2
	if type == 0:
		player += 1
		player %= 2
	set_dots_and_color()
	

func set_dots_and_color():
	
	var piece_color = player_colors[player]
	var dot_color = base_color
	
	if type == 1:
		var swap = piece_color
		piece_color = dot_color
		dot_color = swap
		
	$Polygon2D.color = piece_color
		
	if is_instance_valid(current_dots):
		current_dots.init(number, dot_color)
		current_dots.update()
	else:
		current_dots = dots.instance().init(number, dot_color)
		add_child(current_dots)

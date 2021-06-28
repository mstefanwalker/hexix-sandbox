tool
extends StaticBody2D


var piece = preload("res://piece.tscn")


var id = -1
var current_piece = null

	
func init(id):
	self.id = id
	return self


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and !event.is_pressed():  # release click
		if !is_instance_valid(current_piece):
			current_piece = piece.instance().init(0, 0, 0)
			add_child(current_piece)

extends Node2D

export var lado = 0
var change = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(lado == 0):
		for x in self.get_children():
			x.real_position_x = x.must_be_position_x
			x.real_position_y = x.must_be_position_y
	elif(lado < 0):
		for x in self.get_children():
			x.real_position_x = -150
			x.real_position_y = 296
	else:
		for x in self.get_children():
			x.real_position_x = 1500
			x.real_position_y = 296
	
	if(change == 1):
		
		for x in self.get_children():
			x.move = 1

		change = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

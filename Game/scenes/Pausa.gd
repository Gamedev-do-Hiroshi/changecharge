extends Control


var menu = preload("res://scenes/Menu.tscn")
var child = menu.instance()
func _ready():
	visible = false
	add_child(child)
	
func _input(event):
	if event.is_action_pressed("pause"):
		var new_state = not get_tree().paused
		get_tree().paused = new_state
		visible = new_state
	

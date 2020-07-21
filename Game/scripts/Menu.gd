extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton2_pressed():
	for i in get_tree().get_nodes_in_group("fase"):
		i.queue_free()
	get_tree().change_scene("res://scenes/chooseLevel.tscn")
	get_tree().paused = false

extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			get_parent().get_node("Chapa1").lado+=0
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

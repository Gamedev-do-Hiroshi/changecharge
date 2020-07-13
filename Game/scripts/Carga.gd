extends Area2D
var sinal = true
var mouse_entrou = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.animation = "positive"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if mouse_entrou and event.is_pressed() and event.button_index == BUTTON_LEFT:
		print("CLICKED")
		sinal = !sinal
		$Sprite.animation = "positive" if sinal else "negative"
	
func _on_Carga_mouse_entered():
	mouse_entrou = true
	pass # Replace with function body.


func _on_Carga_mouse_exited():
	mouse_entrou = false
	pass # Replace with function body.

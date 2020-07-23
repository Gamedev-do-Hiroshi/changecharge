extends Control


var menu = preload("res://scenes/Menu.tscn")
var child

func _ready():
	visible = false
	child = menu.instance()
	child.cria("pausa")
	add_child(child)
	
func _input(event):
	if event.is_action_pressed("pause") and child.tipo == "pausa":
		child.cria("pausa")
		pause()
	
func _on_TextureButton_pressed():
	if child.tipo == "pausa":
		pause()
	pass
	
func pause():
	var new_state = not get_tree().paused
	get_tree().paused = new_state
	visible = new_state
	if new_state:
		get_tree().call_group("stop","volta")
	else:
		get_tree().call_group("stop","para")

func passou():
	child.cria("passou")
	visible = true
	pause()
	#$TextureButton.visible = false
	#$TextureButton.queue_free()
	pass

func perdeu():
	child.cria("perdeu")
	visible = true
	pause()
	#$TextureButton.visible = false
	#$TextureButton.queue_free()
	pass
	

extends Control

var menu = preload("res://scenes/Menu.tscn")
var child = menu.instance()
var botao_stop = preload("res://assets/stop.png")
var botao_play = preload("res://assets/play.png")

func _ready():
	child.visible = false
	#$Back.visible = false
	add_child(child)
	

func _on_TextureButton_pressed():
	self.para()

func _input(event):
	if event.is_action_pressed("pause"):
		self.para()
		
func para():
	var new_state = not get_tree().paused
	#$Back.visible = new_state
	child.visible = new_state
	get_tree().paused = new_state
	if new_state:
		$MarginContainer/HBoxContainer/Botao.texture_normal = botao_play
	else:
		$MarginContainer/HBoxContainer/Botao.texture_normal = botao_stop
		
	#visible = new_state

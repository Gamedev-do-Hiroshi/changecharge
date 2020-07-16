tool
extends Area2D

var pontos = []

func _ready():
	pass
	
func _input(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		pontos.push_back(event.position)
		print(event.position)

func _process(delta):
	
	if pontos.size() > 1:
		#for i in pontos.size():
		#	draw_line(pontos[i], pontos[(i+1)%pontos.size()], Color(0x2095f2))
		update()
	pass

func _draw():
	for i in pontos.size():
		draw_line(pontos[i], pontos[(i+1)%pontos.size()], Color(0x2095f2))
	pass

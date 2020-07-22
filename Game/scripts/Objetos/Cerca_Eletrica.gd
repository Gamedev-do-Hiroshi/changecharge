extends Area2D

const espessura = 3

onready var pontos = $Line2D.points
onready var pontos2 = $Line2D.points
var ini_pontos = []
var ini_pontos2 = []

var Amp = [40, 30, 35, 40]
var Ome = [12, 12, 12, 12]
var Amp2 = [3, 2, 3, 1]
var Ome2 = [18, 8, 14, 20]
var Amp3 = [40, 31, 55, 45]
var Ome3 = [12, 12, 12, 12]
var Amp4 = [2, 4, 1, 5]
var Ome4 = [9, 18, 20, 15]

var def = [0,0,1,1]

var t = 0.0

func _ready():
	t = 0.0
	for ponto in pontos:
		ini_pontos.push_back(ponto)
	for ponto in pontos2:
		ini_pontos2.push_back(ponto)
	
func _process(delta):
	t += delta
	for i in range(1, pontos.size()-1):
		pontos[i].x = ini_pontos[i].x + Amp[i-1] * sin(Ome[i-1]*t+i*10)
		pontos[i].y = ini_pontos[i].y + Amp2[i-1] * sin(Ome2[i-1]*t)
		$Line2D.set_point_position(i, pontos[i])
		pontos2[i].x = ini_pontos2[i].x + Amp3[i-1] * sin(Ome3[i-1]*t+(i+5)*22 + def[i-1])
		pontos2[i].y = ini_pontos2[i].y + Amp4[i-1] * sin(Ome4[i-1]*t+(i+5)*22)
		$Line2D2.set_point_position(i, pontos2[i])
		pass
	#update()

func _draw():
	#for i in pontos.size()-1:
	#	draw_line(pontos[i], pontos[i-1], Color(1, 1, 0, 1), espessura)
	#print(pontos)
	pass
	


func _on_Cerca_Eletrica_body_entered(body):
	if body.get_groups().has("player"):
		print("Cerca Eletrica: Player Morre")

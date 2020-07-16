#tool
extends Area2D

const vel_ang = 1
const R = 236.0
const W = 2

var pontos = PoolVector2Array()
var pontosi = PoolVector2Array()
var phis = []
var tempo = 0.0

func _ready():
	set_process_input(true)
	#pontos = $Caminho.curve.get_baked_points()
	#pontosi = $Caminho.curve.get_baked_points()
	#for ponto in pontos:
		#phis.push_back((R - ponto.length()))
		
		
	print($Caminho.curve.get_point_count())
	
	for i in $Caminho.curve.get_point_count()-1:
		pontos.push_back($Caminho.curve.get_point_position(i))
		pontosi.push_back($Caminho.curve.get_point_position(i))
		phis.push_back((R - pontos[i].length()))
	print(pontos)
	
	tempo = 0.0
	
func _process(delta):
	tempo += delta
	self.rotation += vel_ang * delta
	
	for i in pontos.size():
		pontos[i] = (R - phis[i]*cos(5*W*tempo+100*i))* pontosi[i].normalized()
		#pontos[1] = Vector2()#self.position
	update()

func _draw():
	for i in pontos.size():
		draw_line(pontos[i], pontos[(i+1)%pontos.size()], Color(0x2095f2), 3)
	pass

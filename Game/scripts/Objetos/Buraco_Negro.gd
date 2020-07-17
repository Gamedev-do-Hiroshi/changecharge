#tool
extends Area2D

const vel_ang = 1
const R = 236.0
const R2 = 236.0
const W = 2

const p_morrer = 0.6
const p_fase_aleatoria = 0.01
const p_teleporte = 0.39

export var Espessura = 5.0

var pontos = PoolVector2Array()
var pontos3 = PoolVector2Array()
var pontosi = PoolVector2Array()
var pontos2 = PoolVector2Array()
var pontosi2 = PoolVector2Array()
var pontosi3 = PoolVector2Array()
var phis = []
var phis2 = []
var phis3 = []
var tempo = 0.0

func _ready():
	
	pontos = $Caminho.curve.get_baked_points()
	pontosi = $Caminho.curve.get_baked_points()
	pontos3 = $Caminho.curve.get_baked_points()
	pontosi3 = $Caminho.curve.get_baked_points()
	for ponto in pontos:
		phis.push_back((R - ponto.length()))
		phis3.push_back(R - ponto.distance_to(self.position))
		
		
	#print($Caminho.curve.get_point_count())
	
	for i in $Caminho.curve.get_point_count()-1:
		pontos2.push_back($Caminho.curve.get_point_position(i))
		pontosi2.push_back($Caminho.curve.get_point_position(i))
		phis2.push_back((R2 - pontos2[i].length()*R2/R))
	#print(pontos)
	
	tempo = 0.0
	print(pontos.size())
	
func _process(delta):
	tempo += delta
	self.rotation += vel_ang * delta
	
	
	for i in pontos.size():
		pontos[i] = (R - phis[i]*cos(5*W*i*tempo+100*i))* pontosi[i].normalized()
	for i in pontos2.size():
		pontos2[i] = (R2 - phis2[i]*cos(7*W*tempo+100*i))* pontosi2[i].normalized()
	for i in pontos3.size():
		pontos3[i] = 0.4*(R + phis3[i]*cos(W*tempo))* pontos3[i].normalized()
	update()

func _draw():
	for i in pontos2.size():
		draw_line(pontos2[i], pontos2[(i+1)%pontos2.size()], Color(255, 187, 0, 255), Espessura)
	for i in pontos.size():
		draw_line(pontos[i], pontos[(i+1)%pontos.size()], Color(0x2095f2), Espessura)
	for i in pontos3.size():
		draw_line(pontos3[i], pontos3[(i+1)%pontos3.size()], Color(0,0,0,1), Espessura)
	pass


func _on_Buraco_Negro_body_entered(body):
	if body.get_groups().has("player"):
		var prob = randi()%1000
		if prob <= p_fase_aleatoria:
			print("Player passará para uma fase aleatória")
		elif prob <= p_fase_aleatoria + p_teleporte:
			print("Player teleporta")
		else:
			print("Player Morre")
		pass

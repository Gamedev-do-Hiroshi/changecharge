extends Node2D

const v_raio = 3.0
const L = 150.0


onready var raio1 = $Obstaculos/Pivo/Cerca_Eletrica4

var ini_raio1

var t = 0.0

func _ready():
	ini_raio1 = raio1.position.y
	
	t = 0.0

func _physics_process(delta):
	t += delta
	raio1.position.y = ini_raio1 + max(L/2*sin(v_raio*t), 0) - L/2
	
	raio1.scale.y = 0.7*max(sin(v_raio*t), 0)
		

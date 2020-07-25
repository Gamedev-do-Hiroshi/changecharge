extends Node2D

const v_raio = 6.0
const L = 40.0

const v_pivo = 1.0
const ang_max = 1.35

onready var raio1 = $Obstaculos/Cerca_Eletrica
onready var raio2 = $Obstaculos/Cerca_Eletrica2
onready var pivo = $Obstaculos/Pivo

var ini_raio1
var ini_raio2
var outro_t
var ini_ang

var t = 0.0

func _ready():
	ini_raio1 = raio1.position.y
	ini_raio2 = raio2.position.y
	
	ini_ang = pivo.rotation
	
	t = 0.0
	outro_t = 0.0
	pass

func _physics_process(delta):
	t += delta
	raio1.position.y = ini_raio1 + max(L/2*sin(v_raio*t), 0) - L/2
	raio2.position.y = ini_raio2 - max(L/2*sin(v_raio*t), 0) + L/2
	
	raio1.scale.y = 0.2*max(sin(v_raio*t), 0)
	raio2.scale.y = 0.2*max(sin(v_raio*t), 0)
	
	if int(floor(v_pivo * t/ ang_max))%2 == 0:
		pivo.rotation = ini_ang - v_pivo*(t - ang_max * floor(v_pivo * t/ ang_max)/v_pivo)
	else:
		pivo.rotation =  ini_ang - ang_max + v_pivo*(t - ang_max * floor(v_pivo * t/ ang_max)/v_pivo)
		

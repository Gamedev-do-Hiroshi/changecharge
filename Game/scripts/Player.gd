extends KinematicBody2D

onready var raiz = self.get_parent()

const V_COR = Color(1,0,0,1)
const A_COR = Color(0,0,1,1)
const MAX_CHARGE = 50.0
const M_COR = 10.0

var cargas = []

var vel = Vector2()
var ace = Vector2()
var dace = Vector2()
var ant_ace = Vector2()
var ant_dace = Vector2()
#var dragging = false

var vel_pot = 0.0
var K = 1000.0
var campo_magnetico = 0.0
var aux
export var Charge = 0.0

var primeira_passada = true
var t = 0.0

onready var VERMELHO = preload("res://assets/corpo_vermelho.png")
onready var AZUL = preload("res://assets/corpo_azul.png")
onready var V_AURA = preload("res://assets/aura_vermelha.png")
onready var A_AURA = preload("res://assets/aura_azul.png")


func _ready():
	
	primeira_passada = true
	$Cor.modulate = Color(1, 1, 1, min(1,abs(Charge)/MAX_CHARGE))
	$Cor.texture = VERMELHO if Charge > 0 else AZUL
	$Aura.texture = V_AURA if Charge > 0 else A_AURA
	$Aura.modulate = Color(1,1,1,min(abs(Charge)/MAX_CHARGE - 1,20))
	t = 0.0
#	set_process_input(true)

#func _input(event):
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			dragging = true
#		else:
#			dragging = false
#	elif event is InputEventMouseMotion and dragging:
#		position = get_global_mouse_position()
		
func _physics_process(delta):
	t += delta
	movimento(delta)
	self.move_and_slide(vel)
	recebe_carga(-5*delta)
	$Aura.self_modulate = Color(1, 1, 1, 0.8*cos(5*t) + 0.2)
	
func movimento(delta):
	
	ant_ace = ace
	ant_dace = dace
	ace = Vector2()
	dace = Vector2()
	
	for carga in cargas:
		aux = (self.position - carga.position).length()
		ace += K * (self.position - carga.position).normalized() * carga.Charge * Charge / (aux * aux)
		dace -= 2*K * (self.position - carga.position).normalized() * carga.Charge * Charge / (aux * aux * aux)
	
	ace += Charge * campo_magnetico * vel.tangent()
	dace += Charge * campo_magnetico * ace.tangent()
	
	
	if primeira_passada:
		ant_ace = ace
		ant_dace = dace
		primeira_passada = false
	
	
	vel += (ace + ant_ace ) * delta / 2 + vel * (dace - dace) * delta * delta / 12
	
	#self.position += vel * delta

func recebe_carga(valor):
	Charge += valor
	$Cor.modulate = Color(1, 1, 1, min(1,abs(Charge)/MAX_CHARGE))
	$Cor.texture = VERMELHO if Charge > 0 else AZUL
	$Aura.texture = V_AURA if Charge > 0 else A_AURA
	$Aura.modulate = Color(1,1,1,min(abs(Charge)/MAX_CHARGE - 1,2))

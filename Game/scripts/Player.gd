extends KinematicBody2D

onready var raiz = self.get_parent()

var cargas = []

var vel = Vector2()
var ace = Vector2()
var ant_ace = Vector2()

var vel_pot = 0.0
var K = 1000.0
var campo_magnetico = 0.0
var aux
export var charge = 10.0

var primeira_passada = true


func _ready():
	
	primeira_passada = true

func _physics_process(delta):
	
	movimento(delta)
	self.move_and_slide(vel)
	
func movimento(delta):
	
	ant_ace = ace
	ace = Vector2()
	
	for carga in cargas:
		aux = (self.position - carga.position).length()
		ace += K * (self.position - carga.position).normalized() * carga.charge * charge / (aux * aux)
	
	ace += charge * campo_magnetico * vel.tangent()
	
	if primeira_passada:
		ant_ace = ace
		primeira_passada = false
	
	
	vel += (ace + ant_ace ) * delta / 2
	
	#self.position += vel * delta
	

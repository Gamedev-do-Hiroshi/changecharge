extends KinematicBody2D

onready var raiz = self.get_parent()

var cargas = []

var vel = Vector2()
var ace = Vector2()
var dace = Vector2()
var ant_ace = Vector2()
<<<<<<< HEAD
var ant_dace = Vector2()
=======
var dragging = false
>>>>>>> ab1e1865c8c58363bb925133e946f6d78c80a1b8

var vel_pot = 0.0
var K = 1000.0
var campo_magnetico = 0.0
var aux
export var charge = 10.0

var primeira_passada = true


func _ready():
	
	primeira_passada = true
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position = get_global_mouse_position()
		
func _physics_process(delta):
	movimento(delta)
	self.move_and_slide(vel)
	
func movimento(delta):
	
	ant_ace = ace
	ant_dace = dace
	ace = Vector2()
	dace = Vector2()
	
	for carga in cargas:
		aux = (self.position - carga.position).length()
		ace += K * (self.position - carga.position).normalized() * carga.charge * charge / (aux * aux)
		dace -= 2*K * (self.position - carga.position).normalized() * carga.charge * charge / (aux * aux * aux)
	
	ace += charge * campo_magnetico * vel.tangent()
	dace += charge * campo_magnetico * ace.tangent()
	
	
	if primeira_passada:
		ant_ace = ace
		ant_dace = dace
		primeira_passada = false
	
	
	vel += (ace + ant_ace ) * delta / 2 + vel * (dace - dace) * delta * delta / 12
	
	#self.position += vel * delta
	

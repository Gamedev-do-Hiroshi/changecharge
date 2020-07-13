extends KinematicBody2D

onready var raiz = self.get_parent()

var cargas = []

var vel = Vector2()
var ace = Vector2()

var K = 1000.0
var aux
export var charge = 10.0

func _ready():
	
	pass

func _physics_process(delta):
	
	ace = Vector2()
	for carga in cargas:
		aux = (self.position - carga.position).length()
		ace += K * (self.position - carga.position).normalized() * carga.charge * charge / (aux * aux)
	
	vel += ace * delta
	
	self.position += vel * delta
	
	
	
	

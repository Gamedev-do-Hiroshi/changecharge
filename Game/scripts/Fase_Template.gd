extends Node2D

export var fase = 0

export var limite_cima = 0
export var limite_esq = 0
export var limite_baixo = 720
export var limite_dir = 1280

var t = 0.0
var lamp_acesas = 0
var pausado = false

func _ready():
	lamp_acesas = 0
	t = 0.0
	pausado = false

func _process(delta):
	if !pausado:
		t += delta

extends Node2D

export var omega_lampada = 1.0
export var omega_giz5 = 5.0
export var amp_giz8 = 200.0
export var per_giz8 = 10.0

var ini_giz8
var t = 0.0

func _ready():
	ini_giz8 = $Obstaculos/Giz8.position
	t = 0.0
	
func _physics_process(delta):
	t += delta
	$Cargas/Lampada.rotation += omega_lampada*delta
	$Obstaculos/Giz5.rotation += omega_giz5*delta
	$Obstaculos/Giz8.position.y = ini_giz8.y + amp_giz8 * sin(2*PI/per_giz8*t)

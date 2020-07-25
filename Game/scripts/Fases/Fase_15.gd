extends Node2D

export var omega_giz3 = 2.0
export var amp_giz = 100.0
export var per_giz = 10.0
export var amp_giz2 = 70.0
export var per_giz2 = 10.0

var ini_giz
var ini_giz2
var t = 0.0

func _ready():
	t = 0.0
	ini_giz = $Obstaculos/Giz.position
	ini_giz2 = $Obstaculos/Giz2.position

func _physics_process(delta):
	t += delta
	$Obstaculos/Giz3.rotation += omega_giz3*delta
	$Obstaculos/Giz.position.x = ini_giz.x + amp_giz * sin(2*PI/per_giz*t)
	$Obstaculos/Giz2.position.y = ini_giz2.y + amp_giz2 * sin(2*PI/per_giz2*t)

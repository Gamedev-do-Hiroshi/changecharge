extends Node2D

export var omega_lapis = 4.0
export var amp_lapis = 100.0
export var omega_carga = 4.0 
var t = 0.0
onready var lapis = $Lapis2
onready var carga = $Obstaculos/Carga2/Sprite
onready var carga2 = $Obstaculos/Carga3/Sprite
var ini_lapis



func _ready():
	ini_lapis = lapis.position
	
func _process(delta):
	t += delta
	carga.rotation += omega_carga * delta
	carga2.rotation -= omega_carga * delta
	lapis.position = Vector2(0, amp_lapis).rotated(lapis.rotation+PI/2)*sin(omega_lapis*t + PI/2) + ini_lapis
	
	
	pass

extends Node2D

export var omega_lampada = 1.0

func _ready():
	pass
	
func _physics_process(delta):
	$Cargas/Lampada2.rotation += omega_lampada*delta

extends Node2D

export var omega_lampada = 1.0


func _ready():
	
	
func _physics_process(delta):
	$Cargas/Lampada.rotation += omega_lampada*delta

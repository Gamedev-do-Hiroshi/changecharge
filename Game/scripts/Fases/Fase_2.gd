extends Node2D

export var omega_lampada = 1.0
var t = 0.0

func _ready():
	$seta/AnimationPlayer.play("IDLE")
	
	
func _physics_process(delta):
	while $Control/DialogBox.FD == false:
		continue
	$Cargas/Lampada.rotation += omega_lampada*delta
	

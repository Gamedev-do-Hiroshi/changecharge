extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var omega_lampada = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():	
	pass # Replace with function body.

func _physics_process(delta):
	$Cargas/Lampada.rotation += omega_lampada*delta


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

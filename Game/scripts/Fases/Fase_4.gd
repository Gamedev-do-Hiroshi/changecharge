extends Node2D

export var omega_Lapises = 30.0
var p1
var p2

var t = 0.0

func _ready():
	p1 = $Obstaculos/Lapis.position.y
	p2 = $Obstaculos/Lapis2.position.y
	t = 0.0
	
func _physics_process(delta):
	t += delta
	if $Obstaculos/Lapis.position.y < 310 and 0:
		$Obstaculos/Lapis2.position.y = p2 - omega_Lapises*t
		$Obstaculos/Lapis.position.y = p1 + t*omega_Lapises
		for player in get_tree().get_nodes_in_group("player"):
			player.vel.y =  0
			player.position.y = 380
	pass

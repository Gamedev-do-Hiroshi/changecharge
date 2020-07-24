extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var t = 0.0
var state = false
onready var carga = $Cargas/Carga
onready var carga2 = $Cargas/Carga3
onready var trilha = $Cargas/Carga3/Sprite
# Called when the node enters the scene tree for the first time.
func _ready():
#	move(true)
	for seta in get_tree().get_nodes_in_group("setas"):
		seta.modulate = Color(0,0,0,0)
	pass
	# Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	if(!state):
		if abs(trilha.position.x + carga2.Comprimento/2) < 1 and carga2.Charge < 0 and carga.Charge < 0:
			move(false)
			for seta in get_tree().get_nodes_in_group("setas"):
				seta.modulate = Color(0,0,0,0)
			state = true
		else:
			if t >= 4.0:
				for seta in get_tree().get_nodes_in_group("setas"):
					seta.modulate = Color(1,1,1,fmod(t, 1.5))
			move(true)
	pass

func move(a):
	for player in get_tree().get_nodes_in_group("player"):
		player.acendeu = a
	pass

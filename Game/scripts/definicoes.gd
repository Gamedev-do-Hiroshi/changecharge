extends Node2D

export var fase = 0


export var limite_cima = 0
export var limite_esq = 0
export var limite_baixo = 720
export var limite_dir = 1280

export var num_lampadas = 0

var t = 0.0
var lamp_acesas = 0
var pausado = false

var player
var pai_player
var ponta
var caminho
var anim = false
var comecou_agora = true
var ini_player

func _ready():
	lamp_acesas = 0
	t = 0.0
	pausado = false
	comecou_agora = true

func _physics_process(delta):
	if comecou_agora:
		animacao()
		comecou_agora = false
	if anim:
		caminho.unit_offset -= 0.3*delta
		if caminho.unit_offset <= 0:
			termina_animacao()
	else:
		t += delta
		
func animacao():
	for no in get_tree().get_nodes_in_group("player"):
		player = no
	for no in get_tree().get_nodes_in_group("ponta"):
		ponta = no
	caminho = ponta.get_node("Fio/Path2D/PathFollow2D")
	
	anim = true
	ini_player = player.position
	pai_player = player.get_parent()
	pai_player.remove_child(player)
	caminho.add_child(player)
	player.set_owner(caminho)
	player.rotation = 0
	player.get_node("Colisao").disabled = true
	player.scale = Vector2(-0.3, -0.3)
	player.acendeu = true
	player.position = Vector2()
	caminho.unit_offset = 1
	print(ponta.position)
	
	print(caminho)

func termina_animacao():
	caminho.remove_child(player)
	pai_player.add_child(player)
	player.set_owner(pai_player)
	
	player.rotation = 0
	player.scale = Vector2(1, 1)
	player.acendeu = false
	player.position = ini_player
	player.get_node("Colisao").disabled = false
	
	anim = false
	pass

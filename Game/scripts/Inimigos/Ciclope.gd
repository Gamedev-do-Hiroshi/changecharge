extends Area2D

onready var corpo_azul = preload("res://assets/Inimigos/corpo_ciclope_azul1.png")
onready var corpo_vermelho = preload("res://assets/Inimigos/corpo_ciclope_vermelho1.png")


onready var olho_azul = preload("res://assets/Inimigos/olho_ciclope_azul.png")
onready var olho_vermelho = preload("res://assets/Inimigos/olho_ciclope_vermelho.png")

onready var sorriso = preload("res://assets/Inimigos/sorriso.png")
onready var sorriso_reto = preload("res://assets/Inimigos/sorriso_reto.png")

export var carga = -10.0
const centro_olho = Vector2(0, -12.5)
const raio_olho = 7.0

func _ready():
	
	if carga > 0:
		$Corpo.texture = corpo_vermelho
		$Olho.texture = olho_vermelho
	else:
		$Corpo.texture = corpo_azul
		$Olho.texture = olho_azul
		
		$Sorriso.texture = sorriso
		
	for player in get_tree().get_nodes_in_group("player"):
		if player.Charge == 0:
			$Sorriso.texture = sorriso_reto
		elif sign(player.Charge) == sign(carga):
			$Sorriso.flip_v = true
			

func _process(delta):
	
	for player in get_tree().get_nodes_in_group("player"):
		if player.Charge == 0:
			$Sorriso.texture = sorriso_reto
		else:
			$Sorriso.texture = sorriso
			$Sorriso.flip_v = (sign(player.Charge) == sign(carga))
			
			
		$Olho.position = centro_olho + sign(player.Charge)*sign(self.carga)*((self.position - player.position).normalized())*raio_olho
		#print(centro_olho + sign(player.Charge)*sign(self.carga)*((self.position - player.position).normalized()))
	pass

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
			$Caixa/Colisao.disabled = false
		elif sign(player.Charge) == sign(carga):
			$Sorriso.flip_v = true
			$Caixa/Colisao.disabled = false
		else:
			$Sorriso.flip_v = false
			$Caixa/Colisao.disabled = true

func _process(delta):
	for player in get_tree().get_nodes_in_group("player"):
		if player.Charge == 0:
			$Sorriso.texture = sorriso_reto
			$Caixa/Colisao.disabled = false
		else:
			$Sorriso.texture = sorriso
			$Sorriso.flip_v = (sign(player.Charge) == sign(carga))
			$Caixa/Colisao.disabled = (sign(player.Charge) != sign(carga))
		
		$Olho.position = centro_olho + sign(player.Charge)*sign(self.carga)*((self.position - player.global_position).normalized())*raio_olho
		#print(centro_olho + sign(player.Charge)*sign(self.carga)*((self.position - player.position).normalized()))
	pass

func _on_Ciclope_body_entered(body):
	if body.get_groups().has("player") and (sign(body.Charge) != sign(carga)):
		print("Ciclope: Player morre")
		body.morre("ciclope")







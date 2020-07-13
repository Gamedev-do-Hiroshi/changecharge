#tool
extends Node2D

enum OBJETO {PONTA, TOMADA, MAGNETICO}

export(OBJETO) var Objeto = OBJETO.PONTA

export var B = 10.0
export var Altura = 50.0
export var Comprimento = 50.0

onready var X = preload("res://scenes/X.tscn")

func _ready():
	
	if Objeto != OBJETO.PONTA:
		$Ponta.free()
	if Objeto != OBJETO.TOMADA:
		$Tomada.free()
	if Objeto != OBJETO.MAGNETICO:
		$Magnetico.free()
	

	if Objeto == OBJETO.MAGNETICO:
		$Magnetico/Colisao.shape.extents.x = Comprimento/2
		$Magnetico/Colisao.shape.extents.y = Altura/2
		var esp = 20/(abs(B)+10) + 8
		var nxh = floor((Comprimento + esp)/(16 + esp))
		var nxv = floor((Altura + esp)/(16 + esp))
		var H = -Comprimento/2 + 8#(16 + esp)*nxh - esp
		var V = -Altura/2 + 8 #(16 + esp)*nxv - esp
		var esph = (Comprimento - 16*nxh)/(nxh - 1)
		var espv = (Altura - 16*nxv)/(nxv - 1)
		esp = (esph + espv)/2
		
#		H = -H/2
#		V = -V/2
		
		
		print(nxh, " ", nxv)
		for i in nxh:
			for j in nxv:
				var s = X.instance()
				s.position = Vector2(H + i*(16 + esph),V + j*(16+ espv))
				add_child(s)
		pass
	
	pass


func _on_Tomada_body_entered(body):
	if body.get_groups().has("player"):
		print("Passou de fase")


func _on_Magnetico_body_entered(body):
	if body.get_groups().has("player"):
		body.campo_magnetico += B
		pass


func _on_Magnetico_body_exited(body):
	if body.get_groups().has("player"):
		body.campo_magnetico -= B
		pass

extends Node2D

enum OBJETO {PONTA, TOMADA, MAGNETICO}

export(OBJETO) var Objeto = OBJETO.PONTA

export var B = 10.0

func _ready():
	
	if Objeto != OBJETO.PONTA:
		$Ponta.free()
	if Objeto != OBJETO.TOMADA:
		$Tomada.free()
	if Objeto != OBJETO.MAGNETICO:
		$Magnetico.free()
	
	
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

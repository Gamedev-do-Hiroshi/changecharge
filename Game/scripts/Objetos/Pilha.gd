extends Area2D

export var Carga = 10.0


onready var pilha_mais = preload("res://assets/pilha_mais.png")
onready var pilha_menos = preload("res://assets/pilha_menos.png")

var mouse_pilha = 0

func _ready():
	$Sprite.texture = pilha_mais if Carga > 0 else pilha_menos
	mouse_pilha = 0


func _input(event):
	if event == InputEventMouseButton and mouse_pilha%2 == 1 and event.is_pressed():
		Carga = -Carga
		$Sprite.texture = pilha_mais if Carga > 0 else pilha_menos


func _on_Pilha_mouse_entered():
	mouse_pilha += 1
	if mouse_pilha == 100:
		#cria buraco negro
		pass


func _on_Pilha_mouse_exited():
	mouse_pilha += 1
	if mouse_pilha == 100:
		#cria buraco negro
		pass


func _on_Pilha_body_entered(body):
	if body.get_groups().has("player"):
		body.charge += Carga
		self.queue_free()

extends Area2D

export var Carga = 10.0


onready var pilha_mais = preload("res://assets/pilha_mais.png")
onready var pilha_menos = preload("res://assets/pilha_menos.png")
onready var buraco_negro = preload("res://scenes/Objetos/Buraco_Negro.tscn")

var mouse_pilha = 0
var mouse_entrou = false

func _ready():
	$Sprite.texture = pilha_mais if Carga > 0 else pilha_menos
	mouse_pilha = 0


func _input(event):
	if event is InputEventMouseButton and mouse_entrou and event.is_pressed() and event.button_index == BUTTON_LEFT:
		Carga = -Carga
		$Sprite.texture = pilha_mais if Carga > 0 else pilha_menos

	
func _on_Pilha_mouse_entered():
	mouse_entrou = true
	mouse_pilha += 1
	if mouse_pilha == 100:
		#cria buraco negro:
		var objeto = buraco_negro.instance()
		objeto.position = self.position
		objeto.scale = Vector2(0.15, 0.15)
		self.get_parent().add_child(objeto)
		objeto.set_owner(self.get_parent())
		self.queue_free()


func _on_Pilha_mouse_exited():
	mouse_entrou = false
	mouse_pilha += 1
	if mouse_pilha == 100:
		#cria buraco negro:
		var objeto = buraco_negro.instance()
		objeto.position = self.position
		objeto.scale = Vector2(0.15, 0.15)
		self.get_parent().add_child(objeto)
		objeto.set_owner(self.get_parent())
		self.queue_free()


func _on_Pilha_body_entered(body):
	if body.get_groups().has("player"):
		body.recebe_carga(Carga)
		self.queue_free()

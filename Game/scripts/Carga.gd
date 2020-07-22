extends Area2D

onready var raiz = self.get_parent()

var sinal = true
var mouse_entrou = false
export var Charge = 10
export var Trilha = false
export var Comprimento = 0.0
export var Angulo = 0.0
var posicao = Vector2()

onready var scroll1 = preload("res://assets/scroll/scroll1.png")
onready var scroll2 = preload("res://assets/scroll/scroll2.png")
onready var scroll3 = preload("res://assets/scroll/scroll3.png")

var trilha1
var trilha2
var trilha3

var contador
var ini_pos
var segurando_mouse = false
var aux

var pos_trilha = Vector2()
var defasagem = Vector2()

func spark(dist,player):
	if dist <= 100:
		$Lighning.bolt(position,player)

func _ready():
	$Sprite.animation = "positive" if Charge > 0 else "negative"
	for no in get_tree().get_nodes_in_group("player"):
		no.cargas.push_back(self)

	if Trilha:
		trilha()
		contador = 0
	
	segurando_mouse = false
	posicao = self.position
	defasagem = Vector2()

func _input(event):
	
	if event is InputEventMouseButton and mouse_entrou and !event.is_pressed() and (event.button_index == BUTTON_RIGHT or (!Trilha and event.button_index == BUTTON_LEFT)):
		Charge = -Charge
		$Sprite.animation = "positive" if Charge > 0 else "negative"
			
	elif Trilha and event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			if mouse_entrou:
				get_tree().call_group("camera2", "defasagem")
				segurando_mouse = true
				get_tree().call_group("camera2", "mover_inativo")
				contador = 0
				ini_pos = event.position
		else:
			if segurando_mouse and (ini_pos - event.position).length() <= 1:
				Charge = -Charge
				$Sprite.animation = "positive" if Charge > 0 else "negative"
			segurando_mouse = false
				
		
	elif Trilha and segurando_mouse and event is InputEventMouseMotion:
		get_tree().call_group("camera2", "defasagem")
		aux = (event.position + defasagem - self.position).dot(pos_trilha.normalized())
		aux = min(aux, Comprimento/2)
		aux = max(aux, -Comprimento/2)
		posicao = aux*pos_trilha.normalized()
		$Sprite.position = posicao
		$Colisao.position = posicao
		$Contato.position = posicao

func trilha():
	
	pos_trilha = Vector2(0, -Comprimento/2).rotated(Angulo*PI/180)
	
	trilha1 = Sprite.new()
	trilha1.texture = scroll1
	trilha1.position = pos_trilha
	trilha1.rotation_degrees = Angulo
	trilha1.scale.x = 0.6
	
	trilha2 = Sprite.new()
	trilha2.texture = scroll2
	trilha2.position = -pos_trilha
	trilha2.rotation_degrees = Angulo
	trilha2.scale.x = 0.6
	
	trilha3 = Sprite.new()
	trilha3.texture = scroll3
	trilha3.rotation_degrees = Angulo
	trilha3.scale.x = 0.6
	trilha3.scale.y = Comprimento/16
	
	
	self.add_child(trilha1)
	self.add_child(trilha2)
	self.add_child(trilha3)
	
	trilha1.show_behind_parent = true
	trilha2.show_behind_parent = true
	trilha3.show_behind_parent = true
	
	
func _on_Carga_mouse_entered():
	mouse_entrou = true


func _on_Carga_mouse_exited():
	mouse_entrou = false

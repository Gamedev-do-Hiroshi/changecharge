extends Area2D

onready var raiz = self.get_parent()

var sinal = true
var mouse_entrou = false
export var Charge = 10
export var Trilha = false
export var Comprimento = 0.0
export var Angulo = 0.0
export var porcentagem_trilha = 0.0
var posicao = Vector2()
var gposicao = Vector2()

onready var scroll1 = preload("res://assets/scroll/scroll1.png")
onready var scroll2 = preload("res://assets/scroll/scroll2.png")
onready var scroll3 = preload("res://assets/scroll/scroll3.png")
var zap = preload("res://music/sfx/choque.wav")

var trilha1
var trilha2
var trilha3

var contador
var ini_pos
var segurando_mouse = false
var aux

var pos_trilha = Vector2()
var defasagem = Vector2()

var prepara_mudar = false

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
	gposicao = self.global_position
	defasagem = Vector2()
	
	prepara_mudar = false
	
#	if get_tree().is_network_server() and is_network_master():
#		Network.players[int(name)] = self

func _physics_process(delta):
	if is_network_master():
		rset('posicao', posicao)
		pass
	else:
		pass
	if get_tree().is_network_server():
		if prepara_mudar:
			print("MUDOU")
			change()
			prepara_mudar = false
		#Network.update_position(int(name), posicao)
		#rset_unreliable('posicao', posicao)
#		Network.players[int(name)].posicao = posicao
#		Network.players[int(name)].Charge = Charge
	pass

func _input(event):
	
#	if get_tree().is_network_server() and is_network_master():
#		return
	
	if event is InputEventMouseButton and mouse_entrou and !event.is_pressed() and (event.button_index == BUTTON_RIGHT or (!Trilha and event.button_index == BUTTON_LEFT)):
		change()
			
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
				change()
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
	
	gposicao = $Sprite.global_position

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
	
	posicao = (2*porcentagem_trilha/100.0 - 1)*pos_trilha
	
	$Sprite.position = posicao
	$Colisao.position = posicao
	$Contato.position = posicao
	
	self.position -= posicao
	gposicao = $Sprite.global_position
	
	
	
	
func _on_Carga_mouse_entered():
	mouse_entrou = true

func _on_Carga_mouse_exited():
	mouse_entrou = false
	
func change():
	Charge = -Charge
	$Sprite.animation = "positive" if Charge > 0 else "negative"
	var audio = AudioStreamPlayer.new()
	add_child(audio)
	audio.stream = zap
	audio.volume_db = -20
	audio.play()
	
	rset("prepara_mudar", true)
	prepara_mudar = false

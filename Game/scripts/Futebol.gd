extends Node2D

var placar1 = 0
var placar2 = 0

func _ready():
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('server_disconnected', self, '_on_server_disconnected')
	
#	var new_player = preload('res://scenes/Carga.tscn').instance()
#	new_player.name = str(get_tree().get_network_unique_id())
#	new_player.set_network_master(get_tree().get_network_unique_id())
#	add_child(new_player)
	var info = {posicao = Vector2(), Charge = 10, position = Vector2(300,400), prepara_mudar = false} #Network.self_data
	
	#Network.players[get_tree().get_network_unique_id()] = []
	
	if is_network_master():
		for filho in self.get_children():
			print(filho.name)
			filho.set_network_master(get_tree().get_network_unique_id())
			#o certo seria: filho.constroi_online pra cada tipo sei lá ou n
			if filho.get_groups().has("scroll"):
				Network.players[get_tree().get_network_unique_id()] = {posicao = filho.posicao, Charge = filho.Charge, position = filho.position, prepara_mudar = filho.prepara_mudar}
	#new_player.init(info.name, info.position, false)

	
	placar1 = 0
	placar2 = 0
	$Placar1.text = str(placar1)
	$Placar2.text = str(placar2)

func _on_player_disconnected(id):
	#get_node(str(id)).queue_free()
	pass

func _on_server_disconnected():
	get_tree().change_scene('res://interface/Menu.tscn')


func _on_Trave1_body_entered(body):
	placar2 += 1
	$Placar2.text = str(placar2)
	$Player.position = Vector2(640, 360)
	$Player.vel = Vector2()


func _on_Trave2_body_entered(body):
	placar1 += 1
	$Placar1.text = str(placar1)
	$Player.position = Vector2(640, 360)
	$Player.vel = Vector2()

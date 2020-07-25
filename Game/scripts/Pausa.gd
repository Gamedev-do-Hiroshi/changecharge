extends Control

var menu = preload("res://scenes/Menu.tscn")
var child
var seleciona = preload("res://scripts/chooseLevel.gd").new()
var win = preload("res://music/sfx/victory.wav")
#var eat = preload("res://music/sfx/eat.wav")
var eat = preload("res://music/sfx/glup.wav")
var succao = preload("res://music/sfx/succao-2.wav")
var shock = preload("res://music/sfx/shock.wav")
var music = preload("res://music/sfx/hiroshi_music.wav")
var musica
var mutado = false

func _ready():
	visible = false
	child = menu.instance()
	child.cria("pausa")
	add_child(child)
	musica = AudioStreamPlayer.new()
	add_child(musica)
	musica.stream = music
	musica.volume_db = -20
	load_preferences()
	get_tree().call_group("music","mute", mutado)
	print(mutado)
	if mutado:
		musica.stop()
	else:
		musica.play()
	
func _input(event):
	if event.is_action_pressed("pause") and child.tipo == "pausa":
		child.cria("pausa")
		pause()
	
func _on_TextureButton_pressed():
	if child.tipo == "pausa":
		pause()
	pass
	
func pause():
	var new_state = not get_tree().paused
	get_tree().paused = new_state
	visible = new_state
	if new_state:
		get_tree().call_group("stop","volta")
	else:
		get_tree().call_group("stop","para")

func passou():
	child.cria("passou")
	visible = true
	
	var nome = get_parent().get_parent().get_name()
	var num = ""
	for i in range(5, nome.length()):
		num = num+nome[i]
	var audio = AudioStreamPlayer.new()
	add_child(audio)
	audio.stream = win
	audio.volume_db = -10
	audio.play()
	
	seleciona.save(num, str(1))
	
	pause()
	#$TextureButton.visible = false
	#$TextureButton.queue_free()
	pass

func perdeu(tipo):
	child.cria("perdeu")
	visible = true
	var audio = AudioStreamPlayer.new()
	add_child(audio)
	audio.volume_db = -10
	if tipo == "ciclope":
		audio.stream = eat
		audio.volume_db = 5
	elif tipo == "chocado":
		audio.stream = shock
	elif tipo == "sugado":
		audio.stream = succao
	audio.play()
	pause()
	#$TextureButton.visible = false
	#$TextureButton.queue_free()
	pass

func _on_TextureButton2_pressed():
	mutado = !mutado
	save_preferences()
	get_tree().call_group("music","mute", mutado)
	if mutado:
		musica.stop()
	else:
		musica.play()
	pass # Replace with function body.
	
func save():
	var preferences = {
		"music" : mutado
	}
	print(preferences)
	return preferences

func save_preferences():
	var save_game = File.new()
	save_game.open("user://preferences.save", File.WRITE)
	save_game.store_line(to_json(save()))
	save_game.close()
	pass
	
func load_preferences():
	var save_game = File.new()
	if not save_game.file_exists("user://preferences.save"):
		return
	
	save_game.open("user://preferences.save", File.READ)
	while save_game.get_position() < save_game.get_len():        
		var data = parse_json(save_game.get_line())
		mutado = data["music"]
	save_game.close()
	pass

extends Control

var tipo = "pausa"

#var casa = preload("res://Sprites/Main Menu/perigo_casa_lado.png")
#var casa_focus = preload("res://Sprites/Main Menu/perigo_casa_lado_focus.png")
var continua = preload("res://Sprites/Main Menu/play_button_menu.png")
var continua_focus = preload("res://Sprites/Main Menu/play_button_menu_focus.png")
var novamente = preload("res://Sprites/Main Menu/restart_button.png")
var novamente_focus = preload("res://Sprites/Main Menu/restart_button_focus.png")

func _ready():
	cria("pausa")
	pass

func cria(argumento):
	
	tipo = argumento
	
	$RichTextLabel.visible = tipo == "pausa"
	$RichTextLabel2.visible = tipo == "passou"
	$RichTextLabel3.visible = tipo == "perdeu"
	
	if tipo != "passou":
		$TextureButton.texture_normal = novamente
		$TextureButton.texture_hover = novamente_focus
		print("Se liga: ", $TextureButton.texture_focused)
	else:
		$TextureButton.texture_normal = continua
		$TextureButton.texture_hover = continua_focus


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://scenes/chooseLevel.tscn")
	get_tree().paused = false


func _on_TextureButton_pressed():
	get_tree().paused = false
	print("tipo: ", tipo)
	if tipo != "passou":
		print("!= passou")
		print(tipo)
		print(get_tree().get_current_scene().get_name())
		var prox_fase
		for no in get_tree().get_nodes_in_group("definicoes"):
			prox_fase = no.fase
			get_tree().change_scene("res://scenes/Fases/Fase_" + String(prox_fase)+".tscn")
		cria("pausa")
	else:
		print("== passou")
		var prox_fase
		for no in get_tree().get_nodes_in_group("definicoes"):
			prox_fase = no.fase + 1
			var file = File.new()
			
			if file.file_exists("res://scenes/Fases/Fase_" + String(prox_fase) +".tscn"):
				print("EXISTE")
				get_tree().change_scene("res://scenes/Fases/Fase_" + String(prox_fase) +".tscn")
				cria("pausa")
			else:
				print("NAO EXISTE")
	

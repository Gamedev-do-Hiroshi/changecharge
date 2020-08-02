extends Control

var ip = ""
var porta = ""

func _on_TextField_text_changed(new_text):
	ip = new_text
	
func _on_TextField_text_changed2(new_text):
	porta = new_text

func _on_CreateButton_pressed():
	if ip == "":
		return
	Network.create_server(ip)
	_load_game()

func _on_JoinButton_pressed():
	if ip == "":
		return
	Network.connect_to_server(ip)
	_load_game()

func _load_game():
	get_tree().change_scene("res://scenes/Futebol.tscn")



extends Control


var pause = preload("res://scenes/Pausa.tscn")

func _on_TextureButton_pressed():
	var child = pause.instance()
	add_child(child)
	print("is pressing")
	get_tree().change_scene("res://scenes/Pausa.tscn")

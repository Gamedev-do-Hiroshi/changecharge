extends Node


func _physics_process(delta):
	$AnimationPlayer.play("twinkle")


func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/chooseLevel.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()

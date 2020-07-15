extends Node
 
var time = Timer 


func _physics_process(delta):
	$AnimationPlayer.play("twinkle")
	if $TextureButton.is_pressed():
		$AudioStreamPlayer2.play()
		$AnimationPlayer.play("select")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/chooseLevel.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()

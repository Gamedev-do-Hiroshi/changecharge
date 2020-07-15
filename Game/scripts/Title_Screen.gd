extends Node

var t = 0.0
var letra = 0
var letras = []

func _ready():
	letra = 0
	letras = [$Letra1, $Letra2, $Letra3, $Letra4, $Letra5, $Letra6, $Letra7, $Letra8, $Letra9, $Letra10, $Letra11, $Letra12]
	print($Letra1)
	for i in letras:
		print(i.modulate)
		print("Eita")
		i.modulate = Color(0x111111)
		print("Eh mesmo")
		letra = -1
	pass

func _physics_process(delta):
	t += delta
	if t > 1:
		letra = 0
		t = 0
	if t > 0.01 and letra < 12 and letra >= 0:
		letras[letra].modulate = Color(1, 1, 1, 5)#Color(0xd3c933)
		letras[letra].self_modulate = Color(0.827451,0.788235,0.2,1)#Color(0xd3c933)
		letra += 1
		t = 0.0
	$AnimationPlayer.play("twinkle")


func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/chooseLevel.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()

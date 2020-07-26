extends Node
 
var t = 0.0
var letra = 0
var letras = []
var play = true
var thunder = preload("res://music/sfx/thunder.wav")
#A fazer (to do): mudar o modulate das cargas com o tempo

func _ready():
	letra = 0
	letras = [$Titulo/Letra1, $Titulo/Letra2, $Titulo/Letra3, $Titulo/Letra4, $Titulo/Letra5, $Titulo/Letra6, $Titulo/Letra7, $Titulo/Letra8, $Titulo/Letra9, $Titulo/Letra10, $Titulo/Letra11, $Titulo/Letra12]
	print($Titulo/Letra1)
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
	if t > 0.02 and letra < 12 and letra >= 0:
		letras[letra].modulate = Color(1, 1, 1, 5)#Color(0xd3c933)
		letras[letra].self_modulate = Color(0.827451,0.788235,0.2,1)#Color(0xd3c933)
		letra += 1
		t = 0.0
	if letra >= 12 and play:
		var audio = AudioStreamPlayer.new()
		add_child(audio)
		audio.stream = thunder
		audio.play()
		play = false
	$AnimationPlayer.play("twinkle")

func _on_TextureButton_pressed():
	$AudioStreamPlayer2.play()
	yield($AudioStreamPlayer2,"finished")
	get_tree().change_scene("res://scenes/chooseLevel.tscn")

func _on_TextureButton2_pressed():
	get_tree().quit()




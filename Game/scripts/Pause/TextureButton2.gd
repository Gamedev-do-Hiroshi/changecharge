extends TextureButton
var botao_play = preload("res://assets/sound.png")
var botao_mute = preload("res://assets/mute.png")

func _ready():
	self.texture_normal = botao_play

func mute(mutado):	
	if mutado:
		self.texture_normal = botao_mute
	else:
		self.texture_normal = botao_play

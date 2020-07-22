extends TextureButton

var botao_play = preload("res://assets/play.png")
var botao_stop = preload("res://assets/stop.png")

func _ready():
	self.texture_normal = botao_stop


func para():
	self.texture_normal = botao_stop

func volta():
	self.texture_normal = botao_play

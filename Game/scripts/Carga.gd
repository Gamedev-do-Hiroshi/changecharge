extends Area2D

onready var raiz = self.get_parent()

var sinal = true
var mouse_entrou = false
export var Charge = 10

func spark(dist,player):
	if dist <= 100:
		$Lighning.bolt(position,player)

func _ready():
	$Sprite.animation = "positive"
	for no in raiz.get_children():
		if no.get_groups().has("player"):
			no.cargas.push_back(self)
		pass

func _input(event):
	
	if event is InputEventMouseButton and mouse_entrou and event.is_pressed() and event.button_index == BUTTON_LEFT:
		sinal = !sinal
		Charge = -Charge
		$Sprite.animation = "positive" if sinal else "negative"
	
func _on_Carga_mouse_entered():
	mouse_entrou = true


func _on_Carga_mouse_exited():
	mouse_entrou = false

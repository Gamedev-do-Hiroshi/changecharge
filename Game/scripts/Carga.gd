extends Area2D

onready var raiz = self.get_parent()

var sinal = true
var mouse_entrou = false
export var charge = 10

func _ready():
	$Sprite.animation = "positive"
	for no in raiz.get_children():
		if no.get_groups().has("player"):
			no.cargas.push_back(self)
		pass

func _input(event):
	
	if mouse_entrou and event.is_pressed() and event.button_index == BUTTON_LEFT:
		sinal = !sinal
		charge = -charge
		$Sprite.animation = "positive" if sinal else "negative"
	
func _on_Carga_mouse_entered():
	mouse_entrou = true


func _on_Carga_mouse_exited():
	mouse_entrou = false

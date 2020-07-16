extends Area2D

func _ready():
	pass


func _on_Tomada_body_entered(body):
	if body.get_groups().has("player"):
		print("Jogador venceu. Proxima fase")
		self.queue_free()

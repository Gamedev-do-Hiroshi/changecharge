tool
extends Area2D

export var B = 10.0
export var Altura = 50.0
export var Comprimento = 50.0

onready var X = preload("res://scenes/X.tscn")

func _ready():
	
	$Colisao.shape.extents.x = Comprimento/2
	$Colisao.shape.extents.y = Altura/2
	var esp = 20/(abs(B)+10) + 8
	var nxh = floor((Comprimento + esp)/(16 + esp))
	var nxv = floor((Altura + esp)/(16 + esp))
	var H = -Comprimento/2 + 8#(16 + esp)*nxh - esp
	var V = -Altura/2 + 8 #(16 + esp)*nxv - esp
	var esph = (Comprimento - 16*nxh)/(nxh - 1)
	var espv = (Altura - 16*nxv)/(nxv - 1)
	esp = (esph + espv)/2

	#print(nxh, " ", nxv)
	for i in nxh:
		for j in nxv:
			var s = X.instance()
			s.position = Vector2(H + i*(16 + esph),V + j*(16+ espv))
			self.add_child(s)
			
func _process(delta):
	if Engine.editor_hint and ($Colisao.shape.extents.x != Comprimento/2 or $Colisao.shape.extents.y != Altura/2):
		for filho in get_children():
			if filho.get_class() != "CollisionShape2D":
				filho.free()
		_ready()

func _on_Magnetico_body_entered(body):
	if body.get_groups().has("player"):
		body.campo_magnetico += B
		pass


func _on_Magnetico_body_exited(body):
	if body.get_groups().has("player"):
		body.campo_magnetico -= B
		pass

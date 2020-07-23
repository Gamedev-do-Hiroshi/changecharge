extends Area2D

var pai_objeto
var objeto
const V = 0.1
var passou = false

var menu = preload("res://scenes/Menu.tscn")

func _ready():
	$Sprite.light_mask = -10
	passou = false
	pass

func _process(delta):
	if passou and $Fio/Path2D/PathFollow2D.unit_offset < 1:
		$Fio/Path2D/PathFollow2D.unit_offset += 0.2*delta
	if passou and $Fio/Path2D/PathFollow2D.unit_offset >= 1:
		print("Só peço uma coisa: Chame o Menu")
		
		for no in get_tree().get_nodes_in_group("gui"):
			print(no)
			no.passou()
		passou = false
	pass

func _on_Tomada_body_entered(body):
	if !passou and body.get_groups().has("player"):
		print("Jogador venceu. Proxima fase")
		#self.queue_free()
		passou = true
		body.acendeu = true
		pai_objeto = body.get_parent()
		objeto = body
		pai_objeto.remove_child(objeto)
		$Fio/Path2D/PathFollow2D.add_child(objeto)
		objeto.set_owner($Fio/Path2D/PathFollow2D)
		objeto.rotation = 0
		objeto.scale = Vector2(0.3, 0.3)
		objeto.position = Vector2()

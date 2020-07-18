extends Area2D

var acendeu = false
var V = 0.1
var pai_objeto
var objeto

func _ready():
	acendeu = false

func _process(delta):
	
	
	if acendeu and $Path2D/PathFollow2D.unit_offset < 1:
		$Path2D/PathFollow2D.unit_offset += V*0.01*delta
		
		if $Path2D/PathFollow2D.unit_offset >= 1 and objeto:
			$Path2D/PathFollow2D.remove_child(objeto)
			pai_objeto.add_child(objeto)
			objeto.set_owner(pai_objeto)
			objeto.vel = Vector2(0, V).rotated(self.rotation)
			objeto.position = self.position + self.scale * Vector2(0,31).rotated(self.rotation)
			objeto.scale = Vector2(1, 1)
			objeto.acendeu = false
	

func _on_Lampada_body_entered(body):
	if acendeu:
		return
	if body.get_groups().has("player"):
		#$Sprite.animation = "acesa"
		if body.Charge == 0:
			return
		acendeu = true
		body.acendeu = true
		body.lampada = self
		body.acesas += 1
		pai_objeto = body.get_parent()
		objeto = body
		V = objeto.vel.length()
		pai_objeto.remove_child(objeto)
		$Path2D/PathFollow2D.add_child(objeto)
		objeto.set_owner($Path2D/PathFollow2D)
		objeto.scale = Vector2(0.3, 0.3)
		objeto.position = Vector2()

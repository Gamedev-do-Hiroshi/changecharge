extends StaticBody2D

export var espessura = 5.0
export var cor = Color(0, 0, 0, 1)
onready var curva = $Path2D.curve

var pontos

var num = 0
func _ready():
	
	pontos = curva.get_baked_points()
	num = pontos.size()
	cria_caixa()
	pass

func _draw():
	var outro
	for i in num-2:
		outro = (pontos[i+1]-pontos[i]).normalized()*2
		self.draw_line(pontos[i]-outro, pontos[i+1]+outro, cor, espessura)
	pass

func cria_caixa():
	
	var colisao
	var vetor
	
	for i in num-2:
		colisao = CollisionPolygon2D.new()
		vetor = (pontos[i+1] - pontos[i]).tangent().normalized() * (espessura/2)
		colisao.polygon = [pontos[i]-vetor, pontos[i]+vetor, pontos[i+1]+vetor, pontos[i+1]-vetor]
		add_child(colisao)
		#colisao.position = Vector2()
				
	pass



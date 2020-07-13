extends Sprite

var rng = RandomNumberGenerator.new()
var pos
func _ready():
	rng.randomize()
	pos = position

func _process(delta):
	position = pos
	position += Vector2(rng.randi_range(position.x-100,position.x+100),rng.randi_range(position.y-100,position.y+100))*delta

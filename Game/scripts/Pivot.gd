extends Position2D

var parent

func _ready():
	for no in get_tree().get_nodes_in_group("player"):
		parent = no
	update_pivot_angle()
	
func _physics_process(delta):
	update_pivot_angle()
	
func update_pivot_angle():
	rotation = parent.vel.angle()
	


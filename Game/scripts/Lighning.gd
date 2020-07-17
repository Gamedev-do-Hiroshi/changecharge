extends Node2D


onready var main_bolt = $Line2D

var MAX = 20
var MIN = 10
var scl = 3
var b_lenght = 150 
var MAX_branches = 4

var num_bissect = 7 


func bolt(from,to):
	position = from
	for child in main_bolt.get_children().size():
		main_bolt.get_child(child).queue_free()
	create_lightning(main_bolt,to)
	var n_branches = 1 + randi() % MAX_branches
	for branc in n_branches:
		create_branch(main_bolt,to)
		
	$AnimationPlayer.play("flash")
		
func create_lightning(bolt, target_pos):
	var lenght = target_pos - position
	bolt.clear_points()
	bolt.add_point(Vector2(0,0))
	bolt.add_point(lenght)
	
	var time = 1.0
	
	for bissect in num_bissect:
		var local_array = bolt.points
		for point in local_array.size() -1 :
			var start = local_array[point]
			var end = local_array[point + 1]
			var mid = (end - start)/2
			var vec = (end - start).normalized()
			var normal = Vector2(vec.x,vec.y)
			
			var rand_scale = rand_range(MIN,MAX)*random_pos_or_neg()
			var new_point = start + mid + (rand_scale *scl *(lenght/b_lenght)*time*normal)
			time*=0.8
			
			bolt.add_point(new_point,(point*2)+1)
	
func create_branch(branch_from_bolt, target_pos):
	var new_branch = Line2D.new()
	new_branch.default_color = branch_from_bolt.default_color
	new_branch.width = branch_from_bolt.width * rand_range(0.3,0.8)
	new_branch.texture = branch_from_bolt.texture
	new_branch.texture_mode = Line2D.LINE_TEXTURE_STRETCH
	new_branch.position = branch_from_bolt.points[randi()%branch_from_bolt.points.size()]
	branch_from_bolt.add_child(new_branch)
	var new_target = target_pos - new_branch.position + Vector2(rand_range(0.0,100.0),rand_range(0.0,100.0))
	create_lightning(new_branch,new_target)
	
func random_pos_or_neg():
	var s = bool(randi()%2)
	if s:
		return 1
	else:
		return -1

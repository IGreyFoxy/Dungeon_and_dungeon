extends Enemy
class_name Slime

var slimes = [
	load("res://scenes/Minion/Enemy/MiddleSlime.tscn"),
	load("res://scenes/Minion/Enemy/MiddleSlime.tscn"),
	load("res://scenes/Minion/Enemy/MiddleSlime.tscn"),
	load("res://scenes/Minion/Enemy/MiddleSlime.tscn")
	]


func die():
	queue_free()
	spawn_slime(slimes)
func spawn_slime(list):
	var s = []
	for a in list:
		s.append(a.instance())


	for b in s:
		get_parent().get_parent().add_child(b)
		
		b.transform.origin = global_transform.origin
		if not is_on_floor():
			translate_object_local(Vector3(1,0,0))
		


	

extends Enemy

var explosion = preload("res://scenes/Minion/Enemy/Equipment/zombie_toxic_explosion.tscn")

func die():
	spawn_toxic_explosion()
	queue_free()

func spawn_toxic_explosion():
	
	var expl = explosion.instance()
	get_parent().get_parent().add_child(expl)
	expl.transform.origin = global_transform.origin

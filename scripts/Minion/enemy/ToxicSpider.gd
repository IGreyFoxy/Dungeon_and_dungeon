extends Spider


var explosion = load("res://scenes/Minion/Enemy/Equipment/toxic_explosion.tscn")

func _on_hitbox_body_entered(body):
	if body.is_in_group('Player'):
		spawn_toxic_explosion()
		queue_free()
func spawn_toxic_explosion():
	
	var expl = explosion.instance()
	get_parent().get_parent().add_child(expl)
	expl.transform.origin = global_transform.origin
	

extends Core

var web = load("res://scenes/Minion/Enemy/Equipment/trap.tscn")
func _on_firebool_body_entered(body):
	if body.is_in_group('Player'):
		body._on_hitbox_area_entered(damage)
		body.mob_root()
	elif body.is_in_group('Enemy'):
		queue_free()
	else:
		var sliiiize = web.instance()
		sliiiize.transform.origin = global_transform.origin
		get_parent().add_child(sliiiize)
	queue_free()

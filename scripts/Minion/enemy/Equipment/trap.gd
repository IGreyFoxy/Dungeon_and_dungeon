extends Area



func _on_trap_body_entered(body):
	if body.is_in_group('Player'):
		body.mob_root()
	queue_free()

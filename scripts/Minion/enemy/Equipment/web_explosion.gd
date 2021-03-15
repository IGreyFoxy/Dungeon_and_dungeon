extends Explosion

func _on_weapon_body_entered(body):
	if body.is_in_group('Player'):
		body.slow(0.5)
#	нужна анимация
	queue_free()

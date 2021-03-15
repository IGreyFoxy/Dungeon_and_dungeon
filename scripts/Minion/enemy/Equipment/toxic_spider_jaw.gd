extends Enemy_Weapon

func _on_weapon_body_entered(body):
	if body.is_in_group('Player'):
		body._on_hitbox_area_entered(damage)
	

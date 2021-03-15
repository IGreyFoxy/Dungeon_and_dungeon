extends Range_Weapon

func _on_firebool_body_entered(body):
	if body.has_method('_on_hitbox_area_entered'):
		body._on_hitbox_area_entered(damage)
		
		body.translate(Vector3(-0.5,0,0))

	

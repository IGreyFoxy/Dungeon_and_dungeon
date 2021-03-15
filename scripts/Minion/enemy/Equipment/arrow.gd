extends Range_Weapon
class_name Enemy_Range_Weapon
func _on_firebool_body_entered(body):
	if body.is_in_group('Player'):
		body._on_hitbox_area_entered(damage)
		body.canstarttimers('bleeding','HP')

		
	queue_free()

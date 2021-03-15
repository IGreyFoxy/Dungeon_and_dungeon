extends Enemy_Weapon
class_name Explosion
func _on_weapon_body_entered(body):
	
	if body.has_method('_on_hitbox_area_entered') and not is_in_group('ChervPidr'):

		body._on_hitbox_area_entered(damage)
#	нужна анимация
#	queue_free()


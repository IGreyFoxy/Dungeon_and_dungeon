extends Enemy_Range_Weapon
class_name Core
func _on_firebool_body_entered(body):
	if body.is_in_group('Player'):
		body._on_hitbox_area_entered(damage)
	queue_free()
func _physics_process(delta):
	transform.origin += velocity * delta
	velocity.y -= .1

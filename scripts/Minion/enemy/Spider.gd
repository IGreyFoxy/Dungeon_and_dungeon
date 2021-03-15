extends Enemy
class_name Spider
export var z = 4

func _on_hitbox_body_entered(body):
	if body.is_in_group('Player'):
		translate_object_local(Vector3(0,0,z))



func _on_attack_zone_body_entered(body):
	if body.is_in_group('Player'):
		pass
	#Анимация атаки



func _on_attack_zone_body_exited(body):
	if body.is_in_group('Player'):
		pass

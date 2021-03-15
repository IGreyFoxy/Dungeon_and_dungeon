extends Area
onready var yaz_point = $Position3D.global_transform.origin

func _on_weapon_body_entered(body):
	if body.is_in_group('Player'):
		body.transform.origin = lerp(body.transform.origin,yaz_point,0.2)
		queue_free()
		

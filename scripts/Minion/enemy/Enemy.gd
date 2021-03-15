extends Minion
class_name Enemy

var target
var space_state
var not_can_attack = true
onready var raycast = $RayCast
	

func control(delta):
	if not is_on_floor():
		vel.y = -gravity
	agro(delta)
func agro(delta):
	if target and can_target:

		look_at(target.global_transform.origin,Vector3(0,1,0))

		if not_can_attack:
			vel = (target.global_transform.origin - global_transform.origin)
			vel *= speed * delta * accel
		else:
			vel = Vector3()
		if raycast.is_colliding():
			var drug = raycast.get_collider()
			if drug.is_in_group('Enemy'):
				vel = Vector3(0,0,4)
				vel *= speed * accel * delta
	elif root:
		vel = Vector3()
	else:
		vel = Vector3()
func _on_agro_zone_body_entered(body):
	if body.is_in_group('Player'):
		target = body
	


func _on_agro_zone_body_exited(body):
	if body.is_in_group('Player'):
		target = null








func _on_attack_zone_body_entered(body):
	if body.is_in_group('Player'):
		not_can_attack = false
		#Анимация атаки



func _on_attack_zone_body_exited(body):
	if body.is_in_group('Player'):
		not_can_attack = true
		

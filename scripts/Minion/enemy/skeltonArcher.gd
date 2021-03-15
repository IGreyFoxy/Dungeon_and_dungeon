extends Enemy
class_name Range_Enemy

func control(delta):
	if not is_on_floor():
		vel.y = -gravity
	if target and can_target:
		look_at(target.global_transform.origin,Vector3(0,1,0))
	
		vel = Vector3()
		fire(firebool)
		if raycast.is_colliding():
			var drug = raycast.get_collider()
			if drug.is_in_group('Enemy'):
				vel = Vector3(0,0,4)
				vel *= speed * accel * delta
#
#			vel = Vector3(1,0,0)
#			vel *= speed * accel * delta
	
	else:
		vel = Vector3()



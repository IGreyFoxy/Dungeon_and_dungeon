extends Enemy

var can_hit = true


func control(delta):
	if target and can_target:

		if raycast.is_colliding():
			var drug = raycast.get_collider()
			if drug.is_in_group('Enemy'):
				translate(Vector3(0,0,-18))
			
		else:
			if can_hit:
				look_at(target.global_transform.origin,Vector3(0,1,0))
				vel = (target.global_transform.origin - global_transform.origin)
				vel *= speed * delta * accel
				can_hit = false
				speed = 4
				$Timer.start()
	else:
		vel = Vector3()
	


func _on_Timer_timeout():
	can_hit = true
	speed = 10
#поменять таймер на анимацию бэкстепа

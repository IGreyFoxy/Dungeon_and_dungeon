extends Range_Enemy
var flying = false
var can_scream = true
func _physics_process(delta):
	control(delta)
	move_and_slide(vel,Vector3(0,1,0))
	if canStartTimers:
		flaming()
	
	if health <= 0:
		die()
func control(delta):
	if target and can_target:
		
		look_at(target.global_transform.origin,Vector3(0,1,0))
		if can_scream:
			


			vel = Vector3()
			fire(firebool)
				
				

				
#				vel = Vector3(1,0,0)
#				vel *= speed * accel * delta
		elif not can_scream:
			agro(delta)
	elif flying:
		vel = Vector3(0,1.5,0)
		vel *= speed * accel * delta
	else:
		vel = Vector3()


func _on_flyTimer_timeout():
	can_scream = false
	$notflyTimer.start()
	
func _on_notflyTimer_timeout():
	can_target = false
	flying = true
	$Timerforfly.start()

func _on_Timerforfly_timeout():
	can_scream = true
	flying = false
	can_target = true
	$flyTimer.start()

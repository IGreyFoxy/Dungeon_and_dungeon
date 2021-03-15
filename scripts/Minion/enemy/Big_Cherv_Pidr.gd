extends Cherv_Pidr
var hit_waves = [
	load("res://scenes/Minion/Enemy/Equipment/first_hit_wave.tscn"),
	load("res://scenes/Minion/Enemy/Equipment/second_hit_wave.tscn"),
	load("res://scenes/Minion/Enemy/Equipment/thirt_hit_wave.tscn"),
]
var can_look = true
var can_hit = false
func control(delta):
	if target:
		if can_look:
			agro(delta)
			gravity = 30
		elif can_hit:
			look_at(target.global_transform.origin,Vector3(0,1,0))
			vel = (target.global_transform.origin - global_transform.origin)
			vel *= speed * delta * accel
			can_hit = false
			$RunTimer.start()


func hit_wave():
	for exple in hit_waves:
		var expl = exple.instance()
		get_parent().get_parent().add_child(expl)
		expl.transform.origin = global_transform.origin

func _on_borrowTimer_timeout():
	translate(Vector3(0,0,-8))
	$MeshInstance.show()
	
	$flyborrowTimer.start()




func _on_flyborrowTimer_timeout():
	translate(Vector3(0,8,0))
	can_hit = true
	$flyTimer.start()

func _on_flyTimer_timeout():
	can_hit = false
	vel = Vector3()
	hit_wave()
	$CanRunTimer.start()
	can_look = false
func _on_CanRunTimer_timeout():
	can_hit = true
	$RunTimer.start()
	$Run.start()
func _on_RunTimer_timeout():
	can_hit = true


func _on_Run_timeout():
	can_hit = false
	vel = Vector3()
	can_look = true
	print('s')
func _on_attack_zone_body_entered(body):
	if body.is_in_group('Player'):
		pass
	#Анимация атаки



func _on_attack_zone_body_exited(body):
	if body.is_in_group('Player'):
		pass

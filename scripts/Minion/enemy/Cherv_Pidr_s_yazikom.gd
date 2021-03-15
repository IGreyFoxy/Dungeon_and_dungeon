extends Cherv_Pidr
var can_hit_yazik = true
var yazik = preload("res://scenes/Minion/Enemy/Equipment/yazik.tscn")

func control(delta):
	if target:
		look_at(target.global_transform.origin,Vector3(0,1,0))

func hit_yazik():
	var yaz = yazik.instance()
	get_parent().get_parent().add_child(yaz)
	yaz.global_transform.origin = $PositionYazik.global_transform.origin
	


func _on_agro_zone_yazika_body_entered(body):
	if body.is_in_group('Player'):
		if can_hit_yazik:
			hit_yazik()
			$LifeTimerYazika.start()





func _on_agro_zone_yazika_body_exited(body):
	if body.is_in_group('Player'):
		if can_borrow:
				borrow()


func _on_LifeTimerYazika_timeout():
	can_hit_yazik = false
	$LifeTimerYazika.stop()
	$cooldownYazika.start()


func _on_cooldownYazika_timeout():
	can_hit_yazik = true

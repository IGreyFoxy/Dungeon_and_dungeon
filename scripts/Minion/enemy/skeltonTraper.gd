extends Range_Enemy
var can_run = false
var wolf = load("res://scenes/Minion/Enemy/skeletonWolf.tscn")
var can_summon = true
var middle = preload("res://scenes/Minion/Enemy/Equipment/middleflyTrap.tscn")
var long = preload("res://scenes/Minion/Enemy/Equipment/flyTrap.tscn")
var short = preload("res://scenes/Minion/Enemy/Equipment/shortflyTrap.tscn")
func control(delta):
	if target and can_target:
		if can_summon:
			var w = wolf.instance()
			w.transform.origin = $Position3D.global_transform.origin
			get_parent().get_parent().add_child(w)
			can_summon = false
		look_at(target.global_transform.origin,Vector3(0,1,0))
#		var result = space_state.intersect_ray(global_transform.origin,target.global_transform.origin)
#		if result.collider.is_in_group('Player'):
#			vel = Vector3()
#			fire(firebool)
#			$runTimer.start()
		if target.gg_stun or target.root:
			agro(delta)


func _on_runTimer_timeout():
	can_run = true


func _on_middleswapflytrap_zone_body_entered(body):
	firebool = middle


func _on_longswapflytrap_zone_body_entered(body):
	firebool = long


func _on_shortswapflytrap_zone_body_entered(body):
	firebool = short

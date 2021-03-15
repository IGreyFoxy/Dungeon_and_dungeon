extends Range_Enemy
class_name Buffer 
export var self_group = String()
export var buff_dmg = int()
export var buff_hp = int()
export var buff_speed = int()
export var buff_fireboolspeed = int()

	

func control(delta):
	if not is_on_floor():
		vel.y = -gravity
	if target and can_target:
		look_at(target.global_transform.origin,Vector3(0,1,0))
		if raycast.is_colliding():
	
			var drug = raycast.get_collider()
			if drug.is_in_group('Enemy'):
				vel = Vector3(0,0,4)
				vel *= speed * accel * delta
		else: 
			vel = Vector3()



func _on_buff_zone_area_entered(area):
	if area.is_in_group(self_group):
		area.damage += buff_dmg
	if area.is_in_group(self_group) and is_in_group('range'):
		area.fireboolspeed += buff_fireboolspeed


func _on_buff_zone_body_entered(body):
	if body.is_in_group(self_group):
		body.health += buff_hp
		body.speed += buff_speed


func _on_buff_zone_body_exited(body):
	if body.is_in_group(self_group):
		body.health = body.max_health
		body.speed = body.max_speed


func _on_buff_zone_area_exited(area):
	if area.is_in_group(self_group):
		area.damage = area.max_damage
	if area.is_in_group(self_group) and is_in_group('range'):
		area.fireboolspeed = area.max_fireboolspeed

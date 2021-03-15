extends Area

func _on_backhitbox_area_entered(area,amount,bs):
	if area.has_method('_on_weapon_body_entered'):
		var p = get_parent()
		p.health -= amount * bs

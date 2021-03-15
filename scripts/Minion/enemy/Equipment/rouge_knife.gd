extends Enemy_Weapon

var back_step = 0.5
 

func _on_weapon_area_entered(area):
	if area.has_method('_on_backhitbox_area_entered'):
		area._on_backhitbox_area_entered(self,damage,back_step)

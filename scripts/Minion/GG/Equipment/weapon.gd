extends Area
class_name Weapon
export var max_damage = 25

var damage
func _ready():
	damage = max_damage

func _on_weapon_body_entered(body):
	if body.has_method('_on_hitbox_area_entered'):
		body._on_hitbox_area_entered(damage)
		get_parent().get_parent().life_steal(damage)

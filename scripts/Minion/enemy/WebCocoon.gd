extends Slime
class_name WebCocoon
var webExplosion = load("res://scenes/Minion/Enemy/Equipment/web_explosion.tscn")
var spiders = [
	load("res://scenes/Minion/Enemy/Spider.tscn"),
	load("res://scenes/Minion/Enemy/Spider.tscn"),
	load("res://scenes/Minion/Enemy/Spider.tscn"),
	load("res://scenes/Minion/Enemy/Spider.tscn"),
	load("res://scenes/Minion/Enemy/Spider.tscn"),
]
var spider = load("res://scenes/Minion/Enemy/Spider.tscn")
func spawn_slime(list):
	var s = []
	for a in list:
		s.append(a.instance())
	s[0].transform.origin = $Position3D.global_transform.origin
	s[1].transform.origin = $Position3D2.global_transform.origin
	s[2].transform.origin = $Position3D3.global_transform.origin
	s[3].transform.origin = $Position3D4.global_transform.origin
	s[4].transform.origin = $Position3D5.global_transform.origin
	get_parent().add_child(s[0])
	get_parent().add_child(s[1])
	get_parent().add_child(s[2])
	get_parent().add_child(s[3])
	get_parent().add_child(s[4])
func control(delta):
	if target:
		$LifeTimer.start()
func set_Weapon(weapon):
	pass
func _on_LifeTimer_timeout():
	spawn_slime(spiders)
	spawn_web_explosion()
	queue_free()
func spawn_web_explosion():
	
	var expl = webExplosion.instance()
	get_parent().get_parent().add_child(expl)
	expl.transform.origin = global_transform.origin
func die():
	queue_free()
	var sp = spider.instance()
	sp.transform.origin = $Position3D5.global_transform.origin
	get_parent().add_child(sp)

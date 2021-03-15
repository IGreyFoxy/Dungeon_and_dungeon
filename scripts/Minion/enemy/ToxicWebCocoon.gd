extends WebCocoon

var toxicspiders = [
	load("res://scenes/Minion/Enemy/Spider.tscn"),
	load("res://scenes/Minion/Enemy/ToxicSpider.tscn"),
	load("res://scenes/Minion/Enemy/Spider.tscn"),
	load("res://scenes/Minion/Enemy/ToxicSpider.tscn"),
	load("res://scenes/Minion/Enemy/ToxicSpider.tscn")
]
var toxicspider = load("res://scenes/Minion/Enemy/ToxicSpider.tscn")
func _on_LifeTimer_timeout():
	spawn_slime(toxicspiders)
	queue_free()
	spawn_web_explosion()
func die():
	queue_free()
	var sp = toxicspider.instance()
	sp.transform.origin = $Position3D5.global_transform.origin
	get_parent().get_parent().add_child(sp)

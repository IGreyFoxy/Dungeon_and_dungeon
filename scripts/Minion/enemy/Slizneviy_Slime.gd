extends Slime
class_name Slizneviy_Slime
var can_sliize = true
var slize = load("res://scenes/sliiiiizzze.tscn")
var Slznevie_slimes = [
	load("res://scenes/Minion/Enemy/MiddleSlime.tscn"),
	load("res://scenes/Minion/Enemy/Sliznebiy_MiddleSlime.tscn"),
	load("res://scenes/Minion/Enemy/Sliznebiy_MiddleSlime.tscn"),
	load("res://scenes/Minion/Enemy/MiddleSlime.tscn")
	]
func control(delta):
	agro(delta)
	if vel != Vector3() and can_sliize:
		spawn_sliiize()
func die():
	queue_free()
	spawn_slime(Slznevie_slimes)
func spawn_sliiize():
	var sliiiize = slize.instance()
	sliiiize.transform.origin = $sliiiiize_spawner.global_transform.origin
	get_parent().get_parent().add_child(sliiiize)
	$SliiizeTimer.start()
	can_sliize = false


func _on_SliiizeTimer_timeout():
	can_sliize = true

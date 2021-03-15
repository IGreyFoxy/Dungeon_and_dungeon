extends Range_Enemy
class_name Range_Slime
var shortflyslize = preload("res://scenes/Minion/Enemy/Equipment/shortflyslizzee.tscn")
var longflyslize = preload("res://scenes/Minion/Enemy/Equipment/flyslizzee.tscn") 
var middleflyslize = preload("res://scenes/Minion/Enemy/Equipment/middleflyslizzee.tscn")
var slimes = [
	load("res://scenes/Minion/Enemy/MiddleslimeShotingslizzee.tscn"),
	load("res://scenes/Minion/Enemy/MiddleslimeShotingslizzee.tscn"),
	load("res://scenes/Minion/Enemy/MiddleslimeShotingslizzee.tscn"),
	load("res://scenes/Minion/Enemy/MiddleslimeShotingslizzee.tscn")
	]


func die():
	queue_free()
	spawn_slime(slimes)
func spawn_slime(list):
	var s = []
	for a in list:
		s.append(a.instance())


	for b in s:
		get_parent().get_parent().add_child(b)
		
		b.transform.origin = global_transform.origin
		if not is_on_floor():
			translate_object_local(Vector3(1,0,0))


func _on_middleswapslize_zone_body_entered(body):
	firebool = middleflyslize


func _on_longswapslize_zone2_body_entered(body):
	firebool = longflyslize


func _on_shortswapslize_zone3_body_entered(body):
	firebool = shortflyslize




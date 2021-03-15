extends Range_Slime

var range_slime = [
	load("res://scenes/Minion/Enemy/MicroslimeShotingslizzee.tscn"),
	load("res://scenes/Minion/Enemy/MicroSlime.tscn")
	]
func die():
	queue_free()
	spawn_slime(range_slime)

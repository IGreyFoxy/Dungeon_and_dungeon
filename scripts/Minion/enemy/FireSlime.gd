extends Slime
class_name FireSlime
var fireslimes = [
	load("res://scenes/Minion/Enemy/MiddleFireSlime.tscn"),
	load("res://scenes/Minion/Enemy/MiddleFireSlime.tscn"),
	load("res://scenes/Minion/Enemy/MiddleSlime.tscn"),
	load("res://scenes/Minion/Enemy/MiddleFireSlime.tscn")
]




func die():
	queue_free()
	spawn_slime(fireslimes)



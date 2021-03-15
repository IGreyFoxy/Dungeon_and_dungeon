extends Enemy
class_name Cherv_Pidr

var can_borrow = true

func agro(delta):
	if target:
		
		look_at(target.global_transform.origin,Vector3(0,1,0))
		if can_borrow:
			borrow()
func borrow():
	$MeshInstance.hide()
	$borrowTimer.start()
	can_borrow = false
	$cooldownBorrow.start()
	


func _on_borrowTimer_timeout():
	translate(Vector3(0,0,-8))
	$MeshInstance.show()
	

func _on_cooldownBorrow_timeout():
	can_borrow = true


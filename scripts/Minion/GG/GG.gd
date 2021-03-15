extends Minion
class_name Player 
onready var joystick = get_parent().get_node("GG/HUD/GUI/joystick/joystick_button")
onready var tween = $Tween

var sens = 0.2
var direction = Vector2()
var can_attack = false
var gg_stun = false
var can_dodge = ''



func Stun():
	if can_Stun:
		gg_stun = true
		$timers/can_StunTimer.start()
	$timers/StunTimer.start()

func _on_StunTimer_timeout():
	gg_stun = false
	can_Stun = false
	speed = 6


func control(delta):
	
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.y += 1
	if Input.is_action_pressed("ui_down"):
		direction.y -= 1
	direction = joystick.get_value()
	direction = direction.normalized().rotated(-rotation.y)
	vel.x = lerp(vel.x, direction.x * speed, accel * delta)
	vel.z = lerp(vel.z, direction.y * speed, accel * delta)
	set_anim(direction)
	if gg_stun or root:
		speed = 0
	if can_dodge and can_dodge != 'dodged' and stamina >= 25:
		if can_dodge == 'up' and is_on_floor():

			tween.interpolate_property(self,'rotation',rotation,rotation + Vector3(0,0,-6.3),1,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
			
			tween.interpolate_property(self,'translation',translation,translation + Vector3(5,0,0),1,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
			tween.start()
		elif can_dodge == 'down' and is_on_floor():


			tween.interpolate_property(self,'rotation',rotation,rotation + Vector3(0,0,6.3),1,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
			
			tween.interpolate_property(self,'translation',translation,translation + Vector3(-5,0,0),1,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
			tween.start()
		elif can_dodge == 'left' and is_on_floor():


			tween.interpolate_property(self,'rotation',rotation,rotation + Vector3(-6.3,0,0),1,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
			
			tween.interpolate_property(self,'translation',translation,translation + Vector3(0,0,-5),1,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
			tween.start()
		elif can_dodge == 'right' and is_on_floor():


			tween.interpolate_property(self,'rotation',rotation,rotation + Vector3(6.3,0,0),1,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
			
			tween.interpolate_property(self,'translation',translation,translation + Vector3(0,0,5),1,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
			tween.start()
		_on_stamina_area_entered(25)
		canstarttimers('min_stamina_regen','ST')
		can_dodge = 'dodged'
func _on_stamina_area_entered(amount):
	stamina -= amount
	$HUD.update_staminabar(stamina,max_stamina) 
	emit_signal('stamina_changed', stamina * 100/max_stamina,max_stamina)

func _on_hitbox_area_entered(amount):
	health -= amount
	$HUD.update_healthbar(health,max_health) 
	emit_signal('health_changed', health * 100/max_health,max_health)
func _input(event):
	if gg_stun == false:
		if event is InputEventScreenTouch:
			if can_attack:
				if type_weapon == 'mileW':
					attack()
				elif type_weapon == 'rangeW':
					fire(firebool)
			if !event.pressed:
				can_dodge = ''
		
	
		if event is InputEventScreenDrag:
			var movement = event.relative
			if event.index == joystick.ongoing_drag:
				return
			
			if type_weapon == "rangeW":
				$PositionWeapon.rotation.z += deg2rad(movement.y * sens)
				$PositionWeapon.rotation.z = clamp($PositionWeapon.rotation.z,deg2rad(-30),deg2rad(30))
			
			$cam.rotation.x += deg2rad(movement.y * sens)
			$cam.rotation.x = clamp($cam.rotation.x,deg2rad(-25),deg2rad(25))
			rotation.y += -deg2rad(movement.x * sens)
			if !can_dodge:
				if event.relative.y < -90:
					can_dodge = 'up'
					print('sex')
				elif event.relative.y > 90:
					can_dodge = 'down'
					print('sEx')
				elif event.relative.x < -90:
					can_dodge = 'left'
					print('Sex')
				elif event.relative.x > 90:
					can_dodge = 'right'
					print('seX')



func set_anim(dir):
	if dir == Vector2(0,0) and $AnimationPlayer.current_animation != 'idle':
		$AnimationPlayer.play(" ")
	else:
		$AnimationPlayer.stop()
func _on_attack_pressed():
	can_attack = true


func _on_attack_released():
	can_attack = false


func _on_first_active_abillity_pressed():
	pass
	

func _on_first_active_abillity_released():
	pass # Replace with function body.


func _on_twice_active_abillity_released():
	pass # Replace with function body.


func _on_twice_active_abillity_pressed():
	pass # Replace with function body.


func _on_flask_pressed():
	canstarttimers('max_regen','HP')
	


func _on_flask_released():
	pass






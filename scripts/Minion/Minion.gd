extends KinematicBody
class_name Minion
#Сигналы
signal health_changed
signal stamina_changed


#Статы
export var max_health = 100
export var max_speed = 3
export var max_stamina = 100
var speed
var health
var stamina

#Приколы для эффектов
var second = 0
var maxfireflaming = false
var canStartTimers = true 
var typeDOT
var DOT = false
var regenSt = false
var regenHp = false



export var can_Stun = true
var can_target = true
var can_slow = true
var slowcount = 0
var root = false


#Оружие
export var weapon = preload("res://scenes/Minion/GG/equipment/rangeWeapon.tscn")
var type_weapon = null
var can_fire = true
export var firebool = preload("res://scenes/Minion/GG/equipment/firebool.tscn")
onready var weapon_pos = $PositionWeapon

# Физика
var accel = 15
var vel = Vector3()
var gravity = 150







func _ready():
	stamina = max_stamina
	health = max_health
	speed = max_speed
	set_Weapon(weapon)
	

func _physics_process(delta):
	if DOT:
		regenHp = false
		regenSt = false
	if not is_on_floor():
		vel.y = -gravity
	control(delta)
	move_and_slide(vel,Vector3(0,1,0))
	if canStartTimers:
		flaming()

	if health <= 0:
		die()
	
func control(delta):
	pass



# Оружие и атака
func set_Weapon(weapon):
	var new_weapon = weapon.instance()
	weapon_pos.add_child(new_weapon)
	type_weapon = 'rangeW'

func attack():
	pass
func _on_fireTimer_timeout():
	can_fire = true
func fire(fireboool):
	if can_fire:
		can_fire = false
		$fireTimer.start()
		var f = fireboool.instance()
		f.start($PositionWeapon/FirePos.global_transform)
		get_parent().get_parent().add_child(f)
		



# Изменения ХП
func _on_hitbox_area_entered(amount):
	health -= amount
	$Healthbar.update(health,max_health) 
	emit_signal('health_changed', health * 100/max_health,max_health)


func die():
	queue_free()

func flask(heal):
	health += heal
	$Healthbar.update(health,max_health) 
	emit_signal('health_changed', health * 100/max_health,max_health)
# Эффекты
func slow(sp):
	if can_slow:
		speed = speed * sp
		slowcount += 1
		if slowcount >= 6:
			can_slow = false
			Stun()
			$timers/SlowTimer.start()
	
func flaming():

	if not DOT:
		if regenHp:
			if second:
				second = 0
				health += typeDOT
				emit_signal('health_changed', health * 100/max_health,max_health)
		elif regenSt:
			if second:
				second = 0
				stamina += typeDOT
				emit_signal('stamina_changed', stamina * 100/max_stamina,max_stamina)
	if DOT:
		if second:
			second = 0
			health -= typeDOT
		
			emit_signal('health_changed', health * 100/max_health,max_health)
	if maxfireflaming:
		$timers/timeFlaming.stop()
		$timers/max_flame_secondTimer.stop()
		maxfireflaming = false
		DOT = false

func Stun():
	if can_Stun:
		can_target = false
		$timers/StunTimer.start()
		$timers/can_StunTimer.start()

func life_steal(lifesteal):
	health += lifesteal
	#реализация метода в мече ГГ

func mob_root():
	root = true
	$timers/rootTimer.start()
#Таймеры Эффектов
func _on_timeFlaming_timeout():
	second += 1 

	
func _on_max_flame_secondTimer_timeout():
	if DOT:
		maxfireflaming = true
	
func start_timers():
	$timers/timeFlaming.start()
	$timers/max_flame_secondTimer.start()


func canstarttimers(type,typeregen):
	if type == 'flaming':
		typeDOT = 8
		DOT = true
	elif type == 'bleeding':
		typeDOT = 5
		DOT = true
	elif type == 'posioning':
		typeDOT = 3
		DOT = true
	if DOT == false:
	
		regenHp = true
		if type == 'min_regen':
			typeDOT = 2
		if type == 'low_regen':
			typeDOT = 4
		if type == 'middle_regen':
			typeDOT = 6
		if type == 'high_regen':
			typeDOT = 8
		if type == 'max_regen':
			typeDOT = 10
			
		if typeregen == 'ST':
			if type == 'min_stamina_regen':
				typeDOT = 2
			if type == 'low_stamina_regen':
				typeDOT = 4
			if type == 'middle_stamina_regen':
				typeDOT = 6
			if type == 'high_stamina_regen':
				typeDOT = 8
			if type == 'max_stamina_regen':
				typeDOT = 10
			regenSt = true

	start_timers()
	flaming()


func _on_StunTimer_timeout():
	can_target = true
	can_Stun = false

func _on_can_StunTimer_timeout():
	
	 can_Stun = true
func _on_SlowTimer_timeout():
	can_slow = true
	slowcount = 0
	speed = 6
func _on_rootTimer_timeout():
	root = false
	speed = 6

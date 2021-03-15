extends Spatial


var packed_rooms_first_biome = [
	load("res://scenes/Rooms/room1.tscn"),
	load("res://scenes/Rooms/room6.tscn"),
	load("res://scenes/Rooms/room5.tscn"),
	
]
var packed_rooms_twice_biome = [
	load("res://scenes/Rooms/room4.tscn"),
	load("res://scenes/Rooms/room2.tscn"),
	load("res://scenes/Rooms/room3.tscn"),
]

var room = load("res://scenes/Rooms/main_room.tscn")
var main_room = room.instance()
var can_spawn_main_room = true
var middle_biome_dungeon = {}
var boss = load("res://scenes/Rooms/boss_room.tscn")
var room_of_boss = boss.instance()
var room_of_boss1 = boss.instance()
var room_of_connection = load("res://scenes/Rooms/room7.tscn")
var can_spawn_boss_room = true
var x = 0
var pidorasio_room = load("res://scenes/Rooms/room_of_ElPidorasio.tscn")
var room_of_ElPidorasio = pidorasio_room.instance()
var room_of_ElPidorasio1 = pidorasio_room.instance()
var can_spawn_pidorasio_room = true


func _ready():
	randomize()
#	packed_rooms_first_biome.shuffle()
	middle_biome_dungeon = RoomGenerator.generate(rand_range(-1000,1000),0,0,20)
#	var right_biome_dungeon = RoomGenerator.generate(rand_range(-1000,1000),-4,-4,16)

	
	load_map(middle_biome_dungeon,packed_rooms_first_biome,room_of_boss,room_of_ElPidorasio)
#	load_map(right_biome_dungeon,packed_rooms_twice_biome,room_of_boss1,room_of_ElPidorasio1)

func load_map(dungeon,packed_rooms,boss_room,ElPID_room):
	x = 0
	change_room(packed_rooms)
	
	for i in dungeon.keys():
		print(x)
		x+=1
		if x == 21:
			packed_rooms = packed_rooms_twice_biome
			boss_room = room_of_boss1
			ElPID_room = room_of_ElPidorasio1
			x = 0
			change_room(packed_rooms)
		if can_spawn_main_room:
			add_child(main_room)
			main_room.global_transform.origin = i * 60
			can_spawn_main_room = false
		elif x ==8:
			add_child(ElPID_room)
	
			ElPID_room.global_transform.origin = i * 60
			print('piippi')

		elif x ==15:
			add_child(boss_room)
	
			boss_room.global_transform.origin = i * 60
			print('bossr')
		else:
			var room1 = packed_rooms[randi()%packed_rooms.size()].instance()
			add_child(room1)
			room1.global_transform.origin = i * 60
			print(room1.global_transform.origin)
		var c_rooms = dungeon.get(i).connected_rooms
		if c_rooms.get(Vector3(1,0,0)) != null:
			var room2 = room_of_connection.instance()
			add_child(room2)
			room2.global_transform.origin = i * 60 + Vector3(30,0,0.5)

		if c_rooms.get(Vector3(0,0,1)) != null:
			var room3 = room_of_connection.instance()
			add_child(room3)

			room3.rotation_degrees.y = 90
			room3.global_transform.origin = i * 60 + Vector3(-0.5,0,30)
func change_room(pack):
	randomize()
	pack.shuffle()
	return pack















#var spawned_rooms = [
#	[starting_room,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#]
#
#var spawned_rooms = [
#	[starting_room,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],
#	[null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],
#	[null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#	[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],
#]
#var spawned_rooms = [
#	[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],
#	[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],
#]

#var starting_room = Vector2()
#func _ready():
#	randomize()
#	for i in range(60):
#		place_one_room(i)
#
#func place_one_room(s):
#
#	var vacantplaces = PoolVector2Array()
#	for x in range(spawned_rooms.size()):
#		for y in range(spawned_rooms[x].size()):
##			if spawned_rooms[x][y] == null:
##				continue 
#
#			var maxX = spawned_rooms.count(0) - 1
#			var maxY = spawned_rooms.count(1) - 1
#			if x > 0 && spawned_rooms[x - 1][y] == null:
#				vacantplaces.append(Vector2(x-1,y))
#
#			if y > 0 && spawned_rooms[x][y - 1] == null:
#				vacantplaces.append(Vector2(x,y-1))
#			if x < maxX && spawned_rooms[x + 1][y] == null:
#				vacantplaces.append(Vector2(x+1,y))
#			if y < maxY && spawned_rooms[x][y+1] == null:
#				vacantplaces.append(Vector2(x,y+1))
#	var newroom = packed_rooms[rand_range(0,packed_rooms.size())].instance()
#
#	var position = vacantplaces[s]
#	add_child(newroom)
#	newroom.global_transform.origin = Vector3(position.x-1,0,position.y-1)*30
#
#	spawned_rooms[position.x][position.y] = newroom
#
#	print(vacantplaces)
#
#
#
#
#



















extends Node


var room = load("res://scenes/Rooms/room1.tscn")

var generation_chance = 20
var rooms = []






func generate(room_seed,x,z,size):
	seed(room_seed)
	var dungeon = {}

	dungeon[Vector3(x,0,z)] = room.instance()
	size -= 1
	while size > 0:
		for i in dungeon.keys():
			var direction = rand_range(0,4)
			if direction < 1:
				var new_room_position = i + Vector3(1,0,0)
				if !dungeon.has(new_room_position):
					dungeon[new_room_position] = room.instance()
					size -= 1
				connect_room(dungeon.get(i),dungeon.get(new_room_position),Vector3(1,0,0))
			elif direction < 2:
				var new_room_position = i + Vector3(-1,0,0)
				if !dungeon.has(new_room_position):
					dungeon[new_room_position] = room.instance()
					size -= 1
				connect_room(dungeon.get(i),dungeon.get(new_room_position),Vector3(-1,0,0))
			elif direction < 3:
				var new_room_position = i + Vector3(0,0,1)
				if !dungeon.has(new_room_position):
					dungeon[new_room_position] = room.instance()
					size -= 1
				connect_room(dungeon.get(i),dungeon.get(new_room_position),Vector3(0,0,1))
			elif direction < 4:
				var new_room_position = i + Vector3(0,0,-1)
				if !dungeon.has(new_room_position):
					dungeon[new_room_position] = room.instance()
					size -= 1
				connect_room(dungeon.get(i),dungeon.get(new_room_position),Vector3(0,0,-1))
	return dungeon
	


func connect_room(room1,room2,direction):
	room1.connected_rooms[direction] = room2
	room2.connected_rooms[-direction] = room1
	room1.number_of_connection +=1 
	room2.number_of_connection +=1 

		
		
		

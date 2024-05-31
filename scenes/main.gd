extends Node3D

var green = [preload("res://scenes/tiles/green.tscn"),
				preload("res://scenes/tiles/green2.tscn"),
				preload("res://scenes/tiles/green3.tscn")]
var yellow = [preload("res://scenes/tiles/yellow.tscn"),
			preload("res://scenes/tiles/yellow2.tscn"),
			preload("res://scenes/tiles/yellow3.tscn")]
const turret = preload("res://box/boxe.tscn")

var start_x = -17*6
var start_z = -6
var size = 0.5
var height = 1.0
var width = height * 0.85
var width_count = 42*6
var height_count = 3

var rules = {
	"yellow": ["yellow", "green"],
	"green": ["green", "yellow"]
}

var tiles = []
var turrets =  []

func get_tile(index):
	var colores = []
	var all = ["yellow", "green"]
	var neighbours = [1, 2, -1, -2, -width_count - 1, -width_count + 1]
	var variants = []

	for tile_ind in neighbours:
		if index + tile_ind > 0 and index + tile_ind < height_count * width_count and \
		 typeof(tiles[index + tile_ind]) != TYPE_INT:
			colores.append(tiles[index + tile_ind].get_meta("color"))

	for potential in all:
		var access = true
		for color in colores:
			if not (color in rules[potential]):
				access = false
				break
		if access:
			variants.append(potential)

	var r = variants[randi() % len(variants)]
	if r == "green":
		return green[randi_range(0, 2)]
	else:
		return yellow[randi_range(0, 2)]

func _ready():
	var rotations = [0, 360/6, 360/6*2, 360/6*3,360/6*4,360/6*5]
	for i in range(height_count * width_count):
		tiles.append(0)
	for y in range(height_count):
		for z in range(width_count):
			var index = width_count * y + z
			var tile = get_tile(index).instantiate()
			tiles[index] = tile
			add_child(tile)
			tiles[index].global_position.z = start_z + (y * (height + 0.5))
			tiles[index].global_position.x = start_x + (z * (width / 2))
 
			if z % 2 == 1:
				tiles[index].global_position.z += height * 0.75
			
			if randf() < 0.075:
				place_object(turret, tiles[index])
				
	print(tiles)
	
	for child in get_children():
		if child is CharacterBody3D:
			child.tiles = tiles
	
func place_object(OBJECT_TO_PLACE, nearest_tile):
	var nearest_tile_center = nearest_tile.global_transform.origin
	
	if nearest_tile.get_meta("color") != "blue":
		var new_object = OBJECT_TO_PLACE.instantiate()
		get_tree().root.add_child(new_object)
		new_object.global_transform.origin = nearest_tile_center
		new_object.rotation.y = Vector2(randi_range(-1, 1), randi_range(-1, 1)).angle()
		
		turrets.append(new_object)
		




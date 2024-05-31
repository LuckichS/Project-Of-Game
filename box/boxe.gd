extends Node3D

const bullet = preload("res://scenes/bullet.tscn")

func _ready():
	pass

func _process(delta):
	pass

func _on_timer_timeout():
	shoot()

func shoot():
	var new_bullet = bullet.instantiate()
	add_child(new_bullet)
	new_bullet.global_position = global_position
	new_bullet.rotation = rotation
	
	


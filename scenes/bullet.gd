extends Node3D

var bullet_speed = 2.0 

func _ready():
	pass

func _physics_process(delta):
	position.x -= bullet_speed * delta
	position.y = 0.5

func _on_timer_timeout():
	queue_free()

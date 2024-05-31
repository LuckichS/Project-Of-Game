extends Camera3D



var player

func _ready():
	player= $"../player"


func _process(delta):
	position.x=player.position.x + 0.4
	position.y=player.position.y + 1.7
	position.z=player.position.z - 1

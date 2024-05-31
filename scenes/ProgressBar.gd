extends ProgressBar


@onready var player = $".."

func _process(delta):
	value = player.HP

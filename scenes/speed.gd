extends ProgressBar


@onready var speed = $".."

func _process(delta):
	value = speed.sprint_time

extends VBoxContainer

@export var circleScene:PackedScene

func pause():
	get_tree().paused = true
	$ConfirmationMenu.show()
	
func unpause():
	$ConfirmationMenu.hide()
	get_tree().paused = false
	
	
func _on_run_pressed():
	get_tree().paused = false
	visible = false

extends Control

@onready var pause_menu = $MarginContainer2/ConfirmationMenu

var game_paused: bool = false

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
		
	if game_paused  == true:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()
	


func _on_button_to_menu_pressed():
	game_paused = !game_paused
	

func _on_run_pressed():
	game_paused = !game_paused


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")


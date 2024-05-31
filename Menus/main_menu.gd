extends CanvasLayer


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_setting_pressed():
	get_tree().change_scene_to_file("res://Menus/setting_menu.tscn")

extends Control


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menus/setting_menu.tscn")


func _on_button_pressed():
	OS.shell_open("explorer")
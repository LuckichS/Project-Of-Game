extends CanvasLayer

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")


func _on_audio_pressed():
	get_tree().change_scene_to_file("res://Menus/setting_audio.tscn")


func _on_video_pressed():
	get_tree().change_scene_to_file("res://Menus/setting_video.tscn")


func _on_lang_pressed():
	get_tree().change_scene_to_file("res://Menus/language.tscn")


func _on_info_pressed():
	get_tree().change_scene_to_file("res://Menus/info.tscn")
 

func _on_mods_pressed():
	get_tree().change_scene_to_file("res://Menus/mods.tscn")


func _on_generation_pressed():
	get_tree().change_scene_to_file("res://Menus/upr.tscn")

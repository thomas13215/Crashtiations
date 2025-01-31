extends Control

#Retry
#func _on_button_pressed() -> void:
#	get_node("/root/PlayerVariables").Alive = true
#	get_node("/root/PlayerVariables").Health = 3
#	$"No,No,No".playing = false
#	get_tree().reload_current_scene()
#	hide()

#Main Menu
func _on_button_2_pressed() -> void:
	$"No,No,No".playing = false
	get_tree().change_scene_to_file("res://player/main_menu.tscn")

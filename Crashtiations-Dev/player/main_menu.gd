extends Control

func _on_start_button_pressed() -> void:
	
	#hide start button
	$Start_Button.visible = false
	print("teet")
	#show level select
	$Tutorial.visible = true
	$Level1.visible = true
	#get_node("/root/PlayerVariables").Alive = true
	#get_node("/root/PlayerVariables").Health = 3
	#get_tree().change_scene_to_file("res://scenes/world.tscn")

#Exit button pressed
func _on_exit_button_pressed() -> void:
	get_tree().quit()

#I WILL CODE THIS BETTER LATER DO NOT DO ANYTHING ELSE HERE!!!
#I WILL CODE THIS BETTER LATER DO NOT DO ANYTHING ELSE HERE!!!
#I WILL CODE THIS BETTER LATER DO NOT DO ANYTHING ELSE HERE!!!
#I WILL CODE THIS BETTER LATER DO NOT DO ANYTHING ELSE HERE!!!


#tutroial pressed
func _on_tutorial_pressed() -> void:
	get_node("/root/PlayerVariables").Alive = true
	get_node("/root/PlayerVariables").Health = 3.0
	get_node("/root/PlayerVariables").curDia = ""
	get_node("/root/RevolverVariables").reserveAmmo = 24
	get_node("/root/RevolverVariables").curBullets = 6
	get_node("/root/RevolverVariables").reloading = false
	
	get_tree().change_scene_to_file("res://scenes/world.tscn")
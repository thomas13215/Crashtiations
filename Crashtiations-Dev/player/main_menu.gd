extends Control

func _on_start_button_pressed() -> void:
	
	#hide start button
	$Start_Button.visible = false
	print("teet")
	#show level select
	$Tutorial.visible = true
	$Level1.visible = true
	$Level2.visible = true
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

func levelStart(level: String, revolverEnabled: bool):
	get_node("/root/PlayerVariables").Alive = true
	get_node("/root/PlayerVariables").Health = 3.0
	get_node("/root/PlayerVariables").curDia = ""
	get_node("/root/RevolverVariables").reserveAmmo = 24
	get_node("/root/RevolverVariables").curBullets = 6
	get_node("/root/RevolverVariables").reloading = false
	get_node("/root/RevolverVariables").active = revolverEnabled
	
	get_tree().change_scene_to_file(level)


#tutroial pressed
func _on_tutorial_pressed() -> void:
	levelStart("res://scenes/tutorial.tscn", true)
	

#level 1 pressed still has gun eneabled even when gunActive not marked
func _on_level_1_pressed() -> void:
	levelStart("res://scenes/level3.tscn", true)


func _on_level_2_pressed() -> void:
	levelStart("res://scenes/level2.tscn", true)

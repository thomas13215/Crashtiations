extends Control

func _on_start_button_pressed() -> void:
	
	#hide start button
	$Start_Button.visible = false
	print("teet")
	#show level select
	$Tutorial.visible = true
	$Level1.visible = true
	$Level2.visible = true
	$Level3.visible = true
	$Level4.visible = true
	$Level5.visible = true
	$Level6.visible = true
	$Level7.visible = true
	$Level8.visible = true
	$Level9.visible = true
	$Horde.visible = true
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
	levelStart("res://scenes/level1.tscn", false)


func _on_level_2_pressed() -> void:
	levelStart("res://scenes/level2.tscn", true)


func _on_level_3_pressed() -> void:
	levelStart("res://scenes/level2.tscn", true)


func _on_level_4_pressed() -> void:
	levelStart("res://scenes/level_4.tscn", true)


func _on_level_5_pressed() -> void:
	levelStart("res://scenes/level_5.tscn", true)


func _on_level_6_pressed() -> void:
	pass # Replace with function body.


func _on_level_7_pressed() -> void:
	levelStart("res://scenes/level_7.tscn", true)


func _on_level_8_pressed() -> void:
	pass # Replace with function body.


func _on_level_9_pressed() -> void:
	pass # Replace with function body.


func _on_horde_pressed() -> void:
	pass # Replace with function body.

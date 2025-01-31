extends Button

var deathScene = preload("res://scenes/death.tscn").instantiate()

#Death Placeholder
func _on_pressed() -> void:
	get_tree().root.add_child(deathScene)
	#get_tree().change_scene_to_file("res://scenes/death.tscn")
	hide()

#menu screen play button 
#get_tree().change_scene_to_file("res://scenes/game.tscn")

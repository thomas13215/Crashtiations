extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#random quote here later
	pass # Replace with function body.

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://player/main_menu.tscn")
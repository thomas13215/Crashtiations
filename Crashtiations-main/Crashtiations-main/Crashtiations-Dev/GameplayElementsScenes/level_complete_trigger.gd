extends Area2D

var triggered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#begone
	$TextureRect.visible = false
		
#Player Entered
func _on_body_entered(body: Node2D) -> void:
	if not triggered:
		if body == get_parent().get_node("Player"):
			triggered = true
			#set to dead so gun doesnt shoot
			get_node("/root/PlayerVariables").Alive = false
			get_tree().change_scene_to_file("res://scenes/level_win_screen.tscn")
			#i got him 'em talking 'bout me i'ma topic :fire:fire;Fire

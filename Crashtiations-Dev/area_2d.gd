extends Area2D

@export var GroupName = "EnterGroupNameHere"

var triggered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#begone
	$TextureRect.visible = false
		
#Player Entered
func _on_body_entered(body: Node2D) -> void:
	if not triggered:
		if body == get_parent().get_node("Player"):
			print("Activated trigger: " + GroupName)
			get_tree().call_group(GroupName, "trigger_zombie")
			triggered = true
			#i got him 'em talking 'bout me i'ma topic :fire:fire;Fire

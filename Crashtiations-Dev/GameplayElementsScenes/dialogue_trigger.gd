extends Area2D

@export var Dialogue = "Text here, keep it brief! Will display for 5 seconds!"
var triggered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if not triggered:
		triggered = true
		if body == get_parent().get_node("Player"):
			if Dialogue == "Text here, keep it brief! Will display for 5 seconds!":
				get_node("/root/PlayerVariables").curDia = "Fuck ass you didnt even set dialogue for one of the dialogue triggers LOL"
			#actual ,dialogue
			get_node("/root/PlayerVariables").curDia = Dialogue

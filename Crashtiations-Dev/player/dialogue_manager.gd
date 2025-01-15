extends Control

@onready var label = get_parent()

var lastDia: String = ""

#every frame #REAL!
func _process(_delta: float) -> void:
	dia()

#ghetto timer for dialogue
var counter = 350

func dia():
	#check if dialogue was the same as before, if so hide
	if lastDia == get_node("/root/PlayerVariables").curDia and counter == 350:
		label.visible = false
		return
	if lastDia != get_node("/root/PlayerVariables").curDia:
		counter = 0
	else:
		#dia is different !
		if counter == 350:
			counter = 0
	#Dialogue is different
	#this is so ghetto
	#print("Counter: " + str(counter) + "/350")
	counter += 1
	
	lastDia = get_node("/root/PlayerVariables").curDia
	label.visible = true
	label.text = lastDia
	
	
	#dialorgue is different! change dialogue to text and start timer!

#Dialogue timer ended
func _on_dia_spacer_timeout() -> void:
	pass

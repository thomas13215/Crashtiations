extends Node
#ermemeermermerm
var Alive: bool = true
#Beacuse of how numbers work, the lives you have is ONE more than the number here:
var Health: float = 3.0  #2.5, 2.0, 1.5, 1.0, 0.5, DEAD!!!
#dialogue

var curDia: String = ""
#trigger will set dialogue, in which a script that updates every frame will update the dialogue
#wait 5 seconds, then either make the dialogue blank or reset the timer with the new dialogue

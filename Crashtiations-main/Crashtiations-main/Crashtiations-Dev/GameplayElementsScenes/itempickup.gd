extends Sprite2D

#sanch be like:
#yeah im sanch

@export var itemType: String = "medpack - revAmmo"

var db = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#change stuff accordingly
	#if statement in case one of you monkeys type it wrong, in a perfect world this wopuld be a switch statementZ!!!!!
	if itemType == "medpack":
		#I am a medpack!
		frame = 0
	elif itemType == "revAmmo":
		#I am revolver Ammo!!!!
		frame = 3

#something tocuhed me
func _on_area_2d_body_entered(body: Node2D) -> void:
	#first check if its the player
	if body.name == "Player" and get_node("/root/PlayerVariables").Alive == true and not db:
		db = true
		#now check what item is being used and do the thing!
		if itemType == "medpack":
			#I am a medpack!
			#heal player by 1 heart
			#var playerVar = get_node("/root/PlayerVariables")
			
			#Dont do anything if player is at max hp
			if get_node("/root/PlayerVariables").Health != 3.0:
					get_node("/root/PlayerVariables").Health += 1.0
					#print("health: " + str(playerVar.Health))
					$Heal.play()
					visible = false
					await $Heal.finished
					#delete
					queue_free()
			else:
				db = false
			
		elif itemType == "revAmmo":
			#I am revolver Ammo!!!!
			var resAmmo = get_node("/root/RevolverVariables")
			
			#no ammo cap just give them 2 mags (12 bullets)
			
			resAmmo.reserveAmmo += 12
			$Ammo.play()
			visible = false
			await $Ammo.finished
			queue_free()
			#lol
			
			
			

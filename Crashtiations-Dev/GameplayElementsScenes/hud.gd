extends Node2D

@onready var revolver_global = get_node("/root/RevolverVariables")
@onready var player_global = get_node("/root/PlayerVariables")
@onready var canIgoyet = false #muh

# Called every frame. 'delta' is the elapsed time since the previous frame.
#I can see why erbs lagged now LOL!
func _process(_delta: float) -> void:
	#check if i can go
	if canIgoyet:
		#ddgun stuff - ammo
		$curMag.text = str(revolver_global.curBullets)
		$resAmmo.text = str(revolver_global.reserveAmmo)
		#reloading
		if revolver_global.reloading:
			$ReloadText.visible = true
			$curMag.visible = false
			$resAmmo.visible = false
			$Slash.visible = false
		else:
			$ReloadText.visible = false
			$curMag.visible = true
			$resAmmo.visible = true
			$Slash.visible = true
		
		#health stuff
		#heart 3 is the right most one
		#frame 0 = full, frame 2 = half, frame 4 = empty
		
		#you see this would've been a swqtich statement but forwhatever FUCKING! reason godot 
		#seets a limit with how many switches you can execute in a certain amount of time
		#so im resorting to yanderedeving it out (THUGGING)
		
		#lol
		if player_global.Health > 3:
			player_global.Health = 3
		
		if player_global.Health == 3:
				$Heart1.frame = 0
				$Heart2.frame = 0
				$Heart3.frame = 0
		elif player_global.Health == 2.5:
				$Heart1.frame = 0
				$Heart2.frame = 0
				$Heart3.frame = 2
		elif player_global.Health == 2.0:
				$Heart1.frame = 0
				$Heart2.frame = 0
				$Heart3.frame = 4
		elif player_global.Health == 1.5:
				$Heart1.frame = 0
				$Heart2.frame = 2
				$Heart3.frame = 4
		elif player_global.Health == 1.0:
				$Heart1.frame = 0
				$Heart2.frame = 4
				$Heart3.frame = 4
		elif player_global.Health == 0.5:
				$Heart1.frame = 2
				$Heart2.frame = 4
				$Heart3.frame = 4
		elif player_global.Health == 0.0:
				#yo he dead
				$Heart1.frame = 4
				$Heart2.frame = 4
				$Heart3.frame = 4

#ok godot fuk u
func _on_ihategodotinitnalization_timeout() -> void:
	canIgoyet = true

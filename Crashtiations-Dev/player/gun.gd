extends Sprite2D

#Some gun variables are globals (Revolver_Variables) noob 
@onready var revolver_global = get_node("/root/RevolverVariables")
@onready var gunAnim = $GunAnim 
var gunActive = true  #Do you want the player to have a gun, gun will be given at the end of chapter 1 to avoid annoying work
var bullet_speed = 2000
var bullet = preload("res://player/bullet.tscn")

#Let player load first before this
#check if i can even use the gun this level
#start WaitCheck again if you want to renable the gun or some
func _on_wait_check_timeout() -> void:
	#print(self.visible)
	if self.visible:
		gunActive = true
		
#Gun rotation, IHATE GODOT!!!! :DDD

func _physics_process(_delta: float) -> void:
	
	#print(str(fmod(rotation_degrees, 360.0)))
	#rotation
	look_at(get_global_mouse_position())
	#flip gun so it dont look werid
	#disable flip if gun is facing forward:
	#yes this is a bigass fucking check that runs evrey single frame fuck y ou
	if (fmod(rotation_degrees, 360.0) > 270.0 or fmod(rotation_degrees, 360.0) < 90.0 and fmod(rotation_degrees, 360.0) > 0) or ((fmod(rotation_degrees, 360.0) < -270.0 or fmod(rotation_degrees, 360.0) > -90.0 and fmod(rotation_degrees, 360.0) < 0)):
		flip_v = false
	else:
		flip_v = true
	
	if Input.is_action_just_pressed("Shoot"):
		fire()
	if Input.is_action_just_pressed("Reload"):
		reload()

# how fast the player can shoot
var cooldown = false

#shoot gun 
func fire():
	
	if gunActive and not cooldown and not revolver_global.reloading and not revolver_global.curBullets == 0 and get_node("/root/PlayerVariables").Alive:
		cooldown = true #db
		
		gunAnim.play("Shoot")
		$Shoot.play() #bang 
		print(str(revolver_global.curBullets) + "/" + str(revolver_global.reserveAmmo))
		revolver_global.curBullets -= 1
		#simple bullet rijenjnewrnjwfejn
		#clone bullet scene
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = get_global_position() #put positon to gun
		bullet_instance.rotation_degrees = rotation_degrees #set rotation to gun
		bullet_instance.linear_velocity = Vector2(bullet_speed,0).rotated(rotation) #Add straight velocity from spawn point
		get_tree().get_root().call_deferred("add_child",bullet_instance) #actually show bullet
		#start cooldown
		$Cooldown.start() 
		
	elif gunActive and not cooldown and not revolver_global.reloading and revolver_global.curBullets == 0: #horrible way to do this but  wahtebrer
		cooldown = true #db
		$NoAmmo.play()
		$Cooldown.start() #start cooldown
	
func reload():
	if gunActive and not revolver_global.reloading and not revolver_global.curBullets == 6 and not revolver_global.reserveAmmo == 0:
		revolver_global.reloading = true #db
		$Reload.play()
		await $Reload.finished
		#calculate stuff
		#first check if we have enough reserve ammo
		var dif = revolver_global.maxBullets - revolver_global.curBullets # how much we need to load
		if revolver_global.reserveAmmo >= dif:
			#we have enough or more to reload a full cynlinder!
			revolver_global.curBullets = 6
			revolver_global.reserveAmmo -= dif
		#Have less reserve than amount needed for full cylinder
		elif revolver_global.reserveAmmo < dif:
			revolver_global.curBullets += revolver_global.reserveAmmo
			revolver_global.reserveAmmo = 0
		print(str(revolver_global.curBullets) + "/" + str(revolver_global.reserveAmmo))
		revolver_global.reloading = false


#Gun cooldown
func _on_cooldown_timeout() -> void:
	cooldown = false

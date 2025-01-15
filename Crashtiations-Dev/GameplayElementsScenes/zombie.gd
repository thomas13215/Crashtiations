extends CharacterBody2D

#Zombie triggering stuff
@export var Triggerable = false #Read
var triggered = true #leave true, will be changed accordinly before zomnbie decides to move

#Speed and animations
@export var speed = 70
@onready var animations = $AnimationPlayer

#For targetting
var player_pos
var target_pos
@onready var player = get_parent().get_node("Player")

#Interaction for bullets 
var health = 3 # amount of bullets neeed to kill me LOL!
#uh it down there

#death scene for the player
var deathScene = preload("res://scenes/death.tscn").instantiate()

#Cooldown for the zombie after attacking
#Check everyframe before attacking / moving
var cooldown = false
var attacking = false

#When zombie detects somethin ran into him
func _on_hitbox_body_entered(body: Node2D) -> void:
	#print("MNy stupid name is: " + body.name.substr(0,10))
	#Hit a player and they are alive!
	if body.name == "Player" and get_node("/root/PlayerVariables").Alive == true and not cooldown:
		print("Hit player")
		
		#if player is at 1 hp kill them, if not just daamge them
		if get_node("/root/PlayerVariables").Health == 0.5:
			#kill
			get_node("/root/PlayerVariables").Health = 0
			get_node("/root/PlayerVariables").Alive = false
			#death screen
			get_tree().root.add_child(deathScene)
			hide()
			
		#damage them  and go on cooldown if more than 1 hp
		#ATTACK SEQUENCE
		#REMOVE HEALTH
		get_node("/root/PlayerVariables").Health -= 0.5
		#ATTACK ANIM
		attacking = true
		animations.stop()
		#left
		if target_pos.x < 0: 
			animations.play("Attack_Left")
		#right
		elif target_pos.x > 0:
			animations.play("Attack_Right")
			
		#Start timer for attack anim, at the end the zobmie will idle and enter main cooldown
		$AttackCooldown/AttackAnimTimer.start()
	if body.name == "Bullet" or body.name.substr(0,10) == "@RigidBody":
		print("Bullet hit zombie")
		
		body.queue_free() #del bullet so no penetraction
		
		#health checker
		if health != 0:
			health -= 1
		elif health == 0:
			#fucking kill me
			queue_free()
		

#Attack anim timer ended, part 2 of above
func _on_attack_anim_timer_timeout() -> void:
	#IDLE FOR COOLDOWN
	animations.play("Idle")
	#ACTUAL COOLDOWN
	cooldown = true
	$AttackCooldown.start()
	attacking = false

#cooldown timer ended
func _on_attack_cooldown_timeout() -> void:
	cooldown = false
	
#Animations
func updateAnimation():
	#check if attacking
	if not attacking:
		#left
		if target_pos.x < 0: 
			animations.play("walk_left_Zombie_2")
		#right
		elif target_pos.x > 0:
			animations.play("walk_right_Zombie")

var oneCheck = false
#movement to player - main func, trigger when  zombie wants to be activated
func _physics_process(delta: float) -> void:
	#If no trigger start immedietely
	if Triggerable and not oneCheck: #Check if i need to be triggered or not
		oneCheck = true #debounce
		#if no trigger wait for trigger to begin 
		animations.play("Idle") #idle stance
		triggered = false
		
	#check for cooldown and if im triggered or not
	if not cooldown and not attacking and triggered:
		player_pos = player.position
		target_pos = (player_pos - position).normalized()

		if position.distance_to(player_pos) > 3:
			position += target_pos * speed * delta
		updateAnimation()
	else:
		target_pos = 0

#Main trigger timeer did the thing

func trigger_zombie():
	if not triggered:
		triggered = true
	#print("ZOMBIE TRIGGERED!")
	#play noise here if you want
	#IM TALKING PAYMENT RAVE SHIT PEOPLE ON SOME FAKE SHIT!!!

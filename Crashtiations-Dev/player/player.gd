extends CharacterBody2D

#Character speed
@export var speed: int = 100
@export var gunActive = true  #Do you want the player to have a gun, gun will be given at the end of chapter 1 to avoid annoying work
@onready var animations = $AnimationPlayer

func _ready() -> void:
	pass

#get input from player
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed
	
	
#animation
func updateAnimation():
	#first check if player is actually moving
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		#left
		if velocity.x < 0: 
			animations.play("walkLeft")
		#right
		elif velocity.x > 0:
			animations.play("walkRight")

#Check everyframe to update player accordingly
func _physics_process(_delta: float) -> void:
	#player movement
	handleInput()
	move_and_slide()
	updateAnimation()
	
	#look_at(get_global_mouse_position())

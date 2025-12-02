extends CharacterBody2D

signal hit

@export var SPEED = 200.0	#speed

func get_input(): # The player's movement vector.
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED

func _physics_process(delta: float):
#	velocity = Vector2.ZERO # The player's movement vector.
	
#	if Input.is_action_pressed("move_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("move_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("move_up"):
#		velocity.y -= 1
#	if Input.is_action_pressed("move_down"):
#		velocity.y += 1	
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * SPEED
	
	# Get the input direction and handle the movement/deceleration.
	get_input()
	move_and_slide()
	
	

	if velocity.x == 0:		#adds animations
		$AnimatedSprite2D.animation = "Idle"
		
	if velocity.x != 0:		
		$AnimatedSprite2D.animation = "Walk_right"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "Walk_right"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = false



	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("test")
	emit_signal("hit")

extends CharacterBody2D

#movement stuff
var is_dead : bool = false
@export var SPEED : int = 100	#speed
var lastfacing : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

#animation tree stuff

#placeholder
#@onready var animation_player: AnimationPlayer = $AnimationPlaceholder
#@onready var sprite_2d: Sprite2D = $Placeholder
#@onready var animation_tree: AnimationTree = $AnimationTreeplaceholder

#Novelite
@onready var animation_player: AnimationPlayer = $Animationnocvelite
@onready var sprite_2d: Sprite2D = $Novelite
@onready var animation_tree: AnimationTree = $NoveliteTree


func get_input(): # The player's movement vector.
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * SPEED

func _physics_process( delta ) ->void:
	
	var idle = !velocity
	
	if !idle:
		lastfacing = velocity
		
	# Get the input direction and handle the movement
	if !is_dead:
		get_input()
		move_and_slide()
	
	# Animation tree
	
	#placeholder
	#animation_tree.set("parameters/Run/blend_position", lastfacing)
	#animation_tree.set("parameters/Idle/blend_position",lastfacing)
	
	#novelite
	animation_tree.set("parameters/Walk/blend_position", lastfacing)
	
func _on_health_dead(): #death
	is_dead = true

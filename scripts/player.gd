class_name Player
extends CharacterBody2D

##death flag
var is_dead : bool = false

#region Variable Declaration
@export var zoom : Vector2
@export var SPEED : int = 100	#speed
@export var RUNSPEED : int = 200
var lastfacing : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var run : bool = false
#endregion

#region animation tree

##placeholder
##@onready var animation_player: AnimationPlayer = $AnimationPlaceholder
##@onready var sprite_2d: Sprite2D = $Placeholder
##@onready var animation_tree: AnimationTree = $AnimationTreeplaceholder

##Novelite
@onready var animation_player: AnimationPlayer = $Animationnocvelite
@onready var sprite_2d: Sprite2D = $Novelite
@onready var animation_tree: AnimationTree = $NoveliteTree

#endregion

#region players movement function
func get_input():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if(run == true):
		velocity = direction * RUNSPEED
	else:
		velocity = direction * SPEED

##running
func is_running():
	if(Input.is_action_just_pressed("run")): 
		run = true
	if(Input.is_action_just_released("run")):
		run = false

func toggle_run():
	if(Input.is_action_just_pressed("run_toggle")):
		if(run == false):
			run = true
		else:
			run = false

#endregion

#region active process
func _physics_process( delta ) ->void:
	
##camera zoom
	$Camera2D.set_zoom(zoom)
	
##idle variable
	var idle = !velocity
	
##idle direction save
	if !idle:
		lastfacing = velocity
		
##checks if death flag is set and gets input for movement
	if !is_dead:
		is_running()
		toggle_run()
		get_input()
		move_and_slide()
	
##Animation tree
	
##placeholder
	#animation_tree.set("parameters/Run/blend_position", lastfacing)
	#animation_tree.set("parameters/Idle/blend_position",lastfacing)
	
##novelite
	animation_tree.set("parameters/Walk/blend_position", lastfacing)

#endregion

##set death flag
func _on_health_dead():
	is_dead = true

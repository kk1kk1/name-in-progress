extends Area2D

@onready var chest = get_parent()
@export var interact_name: String = ""
@export var is_interactable: bool = true


func _ready() -> void:
	if chest.chest_contents.types.keys()[chest.chest_contents.type] == "BUFF":
		interact_name = chest.chest_contents.buff.buff_types.keys()[chest.chest_contents.buff.bufftype]
	else:
		interact_name = chest.chest_contents.types.keys()[chest.chest_contents.type]

var interact: Callable = func():
	pass

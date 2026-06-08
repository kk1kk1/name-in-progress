extends StaticBody2D

@export var chest_contents: chest_resource
@onready var interactable: Area2D = $Interactable
@onready var chest_closed: Sprite2D = $ChestClosed
@onready var chest_opened: Sprite2D = $ChestOpened
signal opened

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	if chest_closed.visible:
		chest_closed.hide()
		chest_opened.show()
		interactable.is_interactable = false
		emit_signal("opened")

extends StaticBody2D
#region Declaration
@export var chest_contents: Chest_Resource
@onready var interactable: Area2D = $Interactable
@onready var chest_closed: Sprite2D = $ChestClosed
@onready var chest_opened: Sprite2D = $ChestOpened
signal opened
#endregion

#region Functions
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	if chest_closed.visible:
		chest_closed.hide()
		chest_opened.show()
		self.collision_layer = 1
		interactable.is_interactable = false
		emit_signal("opened")
#endregion

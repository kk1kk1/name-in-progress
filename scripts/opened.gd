extends Node2D

@onready var health: Health = $"../../Player/Health"
@onready var chest = get_parent()

func _ready() -> void:
	chest.opened.connect(_on_chest_opened)

func _on_chest_opened() -> void:
	health.temp_immortal(10)
	print("immortal")

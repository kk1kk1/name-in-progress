extends Node2D

@onready var health: Health = $"../../Player/Health"

func _on_chest_2_opened() -> void:
	health.temp_immortal(10)
	print("immortal")

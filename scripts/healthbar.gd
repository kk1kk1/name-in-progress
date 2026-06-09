extends TextureProgressBar

@export var character: CharacterBody2D

@onready var health: Health = character.find_children("*", "Health")[0]

func _ready() -> void:
	max_value = health.max_health
	value = health.health
	health.health_changed.connect(_update_bar)
	health.max_health_changed.connect(_update_bar)
	
func _update_bar(diff: int) -> void:
	max_value = health.get_max_health()
	value = health.get_health()
